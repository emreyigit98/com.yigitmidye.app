import 'package:firebase_app/core/entity/permission_status_entity.dart';

sealed class NotificationState { const NotificationState(); }

class PermissionIdle extends NotificationState { const PermissionIdle(); }

class PermissionStatus extends NotificationState { 
  final PermissionStatusEntity status;
  const PermissionStatus(this.status);
}