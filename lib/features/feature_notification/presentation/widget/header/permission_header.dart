import 'package:app_settings/app_settings.dart';
import 'package:firebase_app/core/entity/permission_status_entity.dart';
import 'package:firebase_app/features/feature_notification/presentation/bloc/notification_cubit.dart';
import 'package:firebase_app/features/feature_notification/presentation/widget/button/header_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionHeader extends StatelessWidget {
  final PermissionStatusEntity status;

  final VoidCallback notDetermined;

  const PermissionHeader({
    super.key,
    required this.status,
    required this.notDetermined,
  });

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      PermissionStatusEntity.authorized => Row(
        children: [
          Icon(Icons.notifications_none_outlined),
          SizedBox(width: 8),
          Text(
            "Bildirim izinleri açık.",
            style: TextStyle(
              fontFamily: "Inter",
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      PermissionStatusEntity.denied => Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.notifications_none_outlined),
                SizedBox(width: 8),
                Text(
                  "Bildirim izinleri kapalı.",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          HeaderButton(
            onTop: () {
              context.read<NotificationCubit>().requestPermission();
            },
            text: "izin ver",
          ),
        ],
      ),
      PermissionStatusEntity.deniedPermanently => Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.notifications_none_outlined),
                SizedBox(width: 8),
                Text(
                  "Bildirimleri açmak için ayarlara gidin.",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          HeaderButton(
            onTop: () async {
              await AppSettings.openAppSettings(
                type: AppSettingsType.notification,
              );
            },
            text: "ayarlar",
          ),
        ],
      ),
      PermissionStatusEntity.notDetermined => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.notifications_none_outlined),
                SizedBox(width: 8),
                Text(
                  "Sipariş detayı ve genel bildirimler için izin verin.",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          HeaderButton(
            onTop: () async {
              context.read<NotificationCubit>().requestPermission();
            },
            text: "izin ver",
          ),
        ],
      ),
      PermissionStatusEntity.provisional => Row(
        children: [
          Icon(Icons.notifications_none_outlined),
          SizedBox(width: 8),
          Text(
            "Bildirimler sessiz olarak iletiliyor.",
            style: TextStyle(
              fontFamily: "Inter",
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    };
  }
}
