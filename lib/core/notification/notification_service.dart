import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/core/constants/constants.dart';
import 'package:firebase_app/core/entity/permission_status_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NotificationService {

  final FirebaseMessaging _messaging;
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final FlutterLocalNotificationsPlugin _notificationsPlugin;

  NotificationService(
    this._messaging,
    this._firebaseAuth,
    this._firebaseFirestore,
    this._notificationsPlugin
  );

  Future<void> initialize() async {
    await _initalizeSettings();
    await _createAndroidChannel();
    _onForegroundMessage();
  }

  Future<void> _initalizeSettings() async {
    final settings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings()
    );
    await _notificationsPlugin.initialize(settings: settings);
  }

  Future<PermissionStatusEntity> permissionRequest() async {
    final permissionStatus = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true
    );
    return _mapStatus(permissionStatus.authorizationStatus);
  }

  Future<PermissionStatusEntity> checkSelfPermission() async {
    final permissionStatus = await _messaging.getNotificationSettings();
    return _mapStatus(permissionStatus.authorizationStatus);
  }

  Future<void> _createAndroidChannel() async {
    final notificationChannel = AndroidNotificationChannel(
      "orders_notifications",
      "Sipariş Bildirimleri",
      description: "Sipariş detayı hakkında bildirim",
      importance: Importance.max,
      playSound: true,
      sound: null
    );
    final androidChannel = _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await androidChannel?.createNotificationChannel(notificationChannel);
  }

  Future<void> _showNotification(RemoteMessage message) async {
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        "orders_notifications",
        "Sipariş Bildirimler",
        channelDescription: "Sipariş detayı hakkında bildirim",
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        sound: null
      ),
      iOS: DarwinNotificationDetails()
    );
    await _notificationsPlugin.show(
      id: details.hashCode,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: details
    );
  }

  Future<void> getToken() async {
    final user = _firebaseAuth.currentUser;
    if(user == null) return;
    final fcmToken = await _messaging.getToken();
    if(fcmToken == null) return;
    await _firebaseFirestore.collection(Constants.users).doc(user.uid).set({
      "fcm_token" : fcmToken
    },SetOptions(merge: true));
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
    });
  }


  PermissionStatusEntity _mapStatus(AuthorizationStatus status) {
    return switch(status) {
      AuthorizationStatus.authorized => PermissionStatusEntity.authorized,
      AuthorizationStatus.denied => PermissionStatusEntity.denied,
      AuthorizationStatus.deniedPermanently => PermissionStatusEntity.deniedPermanently,
      AuthorizationStatus.notDetermined => PermissionStatusEntity.notDetermined,
      AuthorizationStatus.provisional => PermissionStatusEntity.provisional
    };
  }
}