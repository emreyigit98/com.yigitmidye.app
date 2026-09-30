import 'package:firebase_app/core/entity/permission_status_entity.dart';
import 'package:firebase_app/core/notification/notification_service.dart';
import 'package:firebase_app/features/feature_notification/presentation/state/notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {

  final NotificationService _notificationService;

  NotificationCubit(this._notificationService) : super(PermissionIdle());

  Future<void> checkPermission() async {
    final status = await _notificationService.checkSelfPermission();
    emit(PermissionStatus(status));
  }

  Future<void> requestPermission() async {
    final status = await _notificationService.checkSelfPermission();
    if(status == PermissionStatusEntity.notDetermined) {
      final newStatus = await _notificationService.permissionRequest();
      emit(PermissionStatus(newStatus));
    }
  }

  Future<void> getToken() async {
    await _notificationService.getToken();
  }
}