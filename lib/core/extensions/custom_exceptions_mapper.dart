
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension CustomExceptionsMapper on Object {
  CustomException toCustomException() {
    final exception = this;
    return switch(exception) {
      CustomException custom => custom,
      FirebaseAuthException error => switch(error.code) {
        "invalid-phone-number" => InvalidPhoneNumber(),
        _ => UnknownError()
      },
      _ => UnknownError()
    };
  }
}

extension CustomExceptionsMessageMapper on CustomException {
  String toMessage() {
    final exception = this;
    return switch(exception) {
      UserNotFound() => "Bu işleme devam edebilmeniz için giriş yapmalısınız.",
      InvalidPhoneNumber() => "Geçersiz telefon numarası,lütfen tekrar deneyiniz.",
      UnknownError() => "Bilinmeyen bir hata meydana geldi."
    };
  }
}