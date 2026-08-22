sealed class AuthEvent {
  const AuthEvent();
}

class SendCodeEvent extends AuthEvent {
  final String phoneNumber;
  const SendCodeEvent(this.phoneNumber);
}

class ResendCodeEvent extends AuthEvent {
  const ResendCodeEvent();
}

class VerifyCodeEvent extends AuthEvent {
  final String smsCode;
  const VerifyCodeEvent(this.smsCode);
}

class ClearAuthStatusEvent extends AuthEvent {
  const ClearAuthStatusEvent();
}

class StartTimerEvent extends AuthEvent {
  const StartTimerEvent();
}

class TimerEvent extends AuthEvent {
  final int resendSecond;
  const TimerEvent(this.resendSecond);
}