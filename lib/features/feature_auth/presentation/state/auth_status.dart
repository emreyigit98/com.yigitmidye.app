import 'package:firebase_app/features/feature_auth/domain/model/user_model.dart';

sealed class AuthStatus {
  const AuthStatus();
}

class Idle extends AuthStatus {
  const Idle();
}

class SendCodeLoading extends AuthStatus {
  const SendCodeLoading();
}

class SendCodeSuccessful extends AuthStatus {
  const SendCodeSuccessful();
}

class SendCodeError extends AuthStatus {
  final String message;
  const SendCodeError(this.message);
}

class ResendCodeLoading extends AuthStatus {
  const ResendCodeLoading();
}

class ResendCodeSuccessful extends AuthStatus {
  const ResendCodeSuccessful();
}

class ResendCodeError extends AuthStatus {
  final String message;
  const ResendCodeError(this.message);
}

class VerifyCodeLoading extends AuthStatus {
  const VerifyCodeLoading();
}

class VerifyCodeSuccessful extends AuthStatus {
  final UserModel userModel;
  const VerifyCodeSuccessful(this.userModel);
}

class VerifyCodeError extends AuthStatus {
  final String message;
  const VerifyCodeError(this.message);
}
