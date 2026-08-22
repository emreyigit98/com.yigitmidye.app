
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_auth/data/data_source/auth_datasource_repo.dart';
import 'package:firebase_app/features/feature_auth/data/mapper/auth_mapper.dart';
import 'package:firebase_app/features/feature_auth/domain/model/user_model.dart';
import 'package:firebase_app/features/feature_auth/domain/repo/auth_repo.dart';
import 'package:firebase_app/features/feature_auth/domain/result/auth_result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {

  final AuthDatasourceRepo _authDatasourceRepo;
  AuthRepoImpl(this._authDatasourceRepo);

  @override
  Future<AuthResult> sendSmsCode(String phoneNumber, [int? forceResendingToken]) async {
    final result = await _authDatasourceRepo.sendSmsCode(phoneNumber,forceResendingToken);
    return result.toAuthResult();
  }

  @override
  Future<Either<CustomException, UserModel>> verifyPhone(String verificationId, String smsCode) async {
    try {
      final result = await _authDatasourceRepo.verifyPhone(verificationId, smsCode);
      final user = result.user;

      if(user == null) return Left(UserNotFound());

      return Right(UserModel(uid: user.uid, phoneNumber: user.phoneNumber ?? ""));

    }catch(exception) {
      return Left(exception.toCustomException());
    }
  }
}