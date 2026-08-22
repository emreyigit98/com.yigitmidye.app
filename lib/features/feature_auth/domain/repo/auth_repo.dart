
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_auth/domain/model/user_model.dart';
import 'package:firebase_app/features/feature_auth/domain/result/auth_result.dart';

abstract class AuthRepo {
  Future<AuthResult> sendSmsCode(String phoneNumber,[int? forceResendingToken]);
  Future<Either<CustomException,UserModel>> verifyPhone(String verificationId,String smsCode);
}