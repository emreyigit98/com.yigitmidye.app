import 'dart:async';

import 'package:firebase_app/features/feature_auth/data/resource/auth_resource.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasourceRepo {
  Future<AuthResource> sendSmsCode(String phoneNumber,[int? forceResendingToken]);
  Future<UserCredential>verifyPhone(String verificationId,String smsCode);
}