import 'package:firebase_app/core/entity/permission_status_entity.dart';
import 'package:flutter/widgets.dart';

class PermissionHeader extends StatelessWidget {

  final PermissionStatusEntity status;
  const PermissionHeader({super.key,required this.status});

  @override
  Widget build(BuildContext context) {
    return switch(status) {
      PermissionStatusEntity.authorized => Row(),
      PermissionStatusEntity.denied => Row(),
      PermissionStatusEntity.deniedPermanently => Row(),
      PermissionStatusEntity.notDetermined => Row(),
      PermissionStatusEntity.provisional => Row()
    };
  }
}