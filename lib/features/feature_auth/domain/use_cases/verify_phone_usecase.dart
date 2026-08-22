
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_auth/domain/model/user_model.dart';
import 'package:firebase_app/features/feature_auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VerifyPhoneUsecase {
  final AuthRepo _authRepo;
  VerifyPhoneUsecase(this._authRepo);
  Future<Either<CustomException,UserModel>> verifyPhone(String verificationId,String smsCode) async {
    return _authRepo.verifyPhone(verificationId, smsCode);
  }
}