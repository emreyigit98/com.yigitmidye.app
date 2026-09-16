import 'package:equatable/equatable.dart';
import 'package:firebase_app/features/feature_auth/presentation/state/auth_status.dart';


class AuthState extends Equatable {
  final AuthStatus authStatus;
  final String phoneNumber;
  final String verificationId;
  final int? forceResendingToken;
  final int resendSecond;

  bool get isResend => resendSecond <= 0;

   const AuthState({
    this.authStatus = const Idle(),
    this.phoneNumber = "",
    this.verificationId = "",
    this.forceResendingToken,
    this.resendSecond = 60
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    String? phoneNumber,
    String? verificationId,
    int? forceResendingToken,
    int? resendSecond
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationId: verificationId ?? this.verificationId,
      forceResendingToken: forceResendingToken ?? this.forceResendingToken,
      resendSecond: resendSecond ?? this.resendSecond
    );
  }

  @override
  List<Object?> get props => [
    authStatus,
    phoneNumber,
    verificationId,
    forceResendingToken,
    resendSecond
  ];
}