import 'dart:async';

import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_auth/domain/result/auth_result.dart';
import 'package:firebase_app/features/feature_auth/domain/use_cases/send_sms_code_usecase.dart';
import 'package:firebase_app/features/feature_auth/domain/use_cases/verify_phone_usecase.dart';
import 'package:firebase_app/features/feature_auth/presentation/event/auth_event.dart';
import 'package:firebase_app/features/feature_auth/presentation/state/auth_state.dart';
import 'package:firebase_app/features/feature_auth/presentation/state/auth_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendSmsCodeUsecase _sendSmsCodeUsecase;
  final VerifyPhoneUsecase _verifyPhoneUsecase;
  Timer? _timer;

  AuthBloc(this._sendSmsCodeUsecase, this._verifyPhoneUsecase)
    : super(AuthState()) {
    on<SendCodeEvent>(sendSmsCode);
    on<VerifyCodeEvent>(verifyCode);
    on<ResendCodeEvent>(_resendSmsCode);
    on<StartTimerEvent>(_startTimer);
    on<TimerEvent>(_tickTimer);
  }

  Future<void> sendSmsCode(SendCodeEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: SendCodeLoading()));

    final result = await _sendSmsCodeUsecase.sendSmsCode(event.phoneNumber,state.forceResendingToken);

    switch (result) {
      case CodeSendSuccess(
        :final phoneNumber,
        :final verificationId,
        :final forceResendingToken,
      ):
        emit(
          state.copyWith(
            authStatus: SendCodeSuccessful(),
            phoneNumber: phoneNumber,
            verificationId: verificationId,
            forceResendingToken: forceResendingToken,
          ),
        );

        add(StartTimerEvent());

      case VerificationFailure(:final exception):
        emit(state.copyWith(authStatus: SendCodeError(exception.toMessage())));
    }
  }

  Future<void> _resendSmsCode(
    ResendCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: ResendCodeLoading()));

    final result = await _sendSmsCodeUsecase.sendSmsCode(
      state.phoneNumber,
      state.forceResendingToken,
    );

    switch (result) {
      case CodeSendSuccess(
        :final phoneNumber,
        :final verificationId,
        :final forceResendingToken,
      ):
        emit(
          state.copyWith(
            authStatus: ResendCodeSuccessful(),
            phoneNumber: phoneNumber,
            verificationId: verificationId,
            forceResendingToken: forceResendingToken,
          ),
        );

        add(StartTimerEvent());

      case VerificationFailure(:final exception):
        emit(
          state.copyWith(authStatus: ResendCodeError(exception.toMessage())),
        );
    }
  }

  Future<void> verifyCode(
    VerifyCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: VerifyCodeLoading()));

    final result = await _verifyPhoneUsecase.verifyPhone(
      state.verificationId,
      event.smsCode,
    );

    result.fold(
      (error) {
        emit(state.copyWith(authStatus: VerifyCodeError(error.toMessage())));
      },
      (data) {
        emit(state.copyWith(authStatus: VerifyCodeSuccessful(data)));
      },
    );
  }

  void _startTimer(StartTimerEvent event, Emitter<AuthState> emit) {
    _timer?.cancel();
    emit(state.copyWith(resendSecond: 60));
    _timer = Timer.periodic(Duration(seconds: 1), (time) {
      final currentSecond = state.resendSecond;
      if (currentSecond > 0) {
        add(TimerEvent(currentSecond - 1));
      } else {
        time.cancel();
      }
    });
  }

  void _tickTimer(TimerEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(resendSecond: event.resendSecond));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
