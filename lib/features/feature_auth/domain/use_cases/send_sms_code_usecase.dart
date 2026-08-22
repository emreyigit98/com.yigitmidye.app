
import 'package:firebase_app/features/feature_auth/domain/repo/auth_repo.dart';
import 'package:firebase_app/features/feature_auth/domain/result/auth_result.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SendSmsCodeUsecase {
  final AuthRepo _authRepo;
  SendSmsCodeUsecase(this._authRepo);
  Future<AuthResult> sendSmsCode(String phoneNumber,[int? forceResendingToken]) async {
    return _authRepo.sendSmsCode(phoneNumber,forceResendingToken);
  }
}