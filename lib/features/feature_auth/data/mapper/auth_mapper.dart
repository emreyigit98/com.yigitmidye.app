import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_auth/data/resource/auth_resource.dart';
import 'package:firebase_app/features/feature_auth/domain/result/auth_result.dart';

extension AuthMapper on AuthResource {
  AuthResult toAuthResult() {
    return switch (this) {
      CodeSend(
        :final phoneNumber,
        :final verifivationId,
        :final forceResendingToken,
      ) =>
        CodeSendSuccess(phoneNumber, verifivationId, forceResendingToken),
      VerificationFailed(:final exception) => VerificationFailure(exception.toCustomException())  
    };
  }
}