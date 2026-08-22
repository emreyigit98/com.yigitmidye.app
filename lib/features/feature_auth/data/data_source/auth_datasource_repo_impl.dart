import 'dart:async';
import 'package:firebase_app/features/feature_auth/data/data_source/auth_datasource_repo.dart';
import 'package:firebase_app/features/feature_auth/data/resource/auth_resource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: AuthDatasourceRepo)
class AuthDatasourceRepoImpl implements AuthDatasourceRepo {
  final FirebaseAuth _firebaseAuth;
  AuthDatasourceRepoImpl(this._firebaseAuth);

  @override
  Future<AuthResource> sendSmsCode(String phoneNumber, [int? forceResendingToken]) async {

    final completer = Completer<AuthResource>();

    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      forceResendingToken: forceResendingToken,
      verificationCompleted: (_) {
        print('verificationCompleted tetiklendi');
      },
      verificationFailed: (error) {
        if(!completer.isCompleted) {
          completer.complete(VerificationFailed(error));
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        if(!completer.isCompleted) {
          completer.complete(CodeSend(phoneNumber, verificationId, forceResendingToken));
        }
      },
      codeAutoRetrievalTimeout: (_) {},
    );
    return completer.future;
  }

  @override
  Future<UserCredential> verifyPhone(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential;
  }
}