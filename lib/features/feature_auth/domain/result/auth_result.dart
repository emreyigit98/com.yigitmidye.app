import 'package:firebase_app/core/exceptions/custom_exception.dart';

sealed class AuthResult {
  const AuthResult();
}

class CodeSendSuccess extends AuthResult {
  final String phoneNumber;
  final String verificationId;
  final int? forceResendingToken;
  const CodeSendSuccess(
    this.phoneNumber,
    this.verificationId,
    this.forceResendingToken
  );
}

class VerificationFailure extends AuthResult {
  final CustomException exception;
  const VerificationFailure(this.exception);
}
