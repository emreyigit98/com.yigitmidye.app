import 'package:firebase_auth/firebase_auth.dart';

sealed class AuthResource { const AuthResource(); }

class CodeSend extends AuthResource { 
  final String phoneNumber;
  final String verifivationId;
  final int? forceResendingToken;

  const CodeSend(
    this.phoneNumber,
    this.verifivationId,
    this.forceResendingToken
  );
}

class VerificationFailed extends AuthResource {
  final FirebaseAuthException exception;
  const VerificationFailed(this.exception);
}