
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension CustomExceptionsMapper on Object {
  CustomException toCustomException() {
    final exception = this;
    return switch(exception) {
      FirebaseException error => switch(error.code) {
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
      UserNotFound() => "Geçerli kullanıcı bilginiz bulunamadı.",
      InvalidPhoneNumber() => "Geçersiz telefon numarası,lütfen tekrar deneyiniz.",
      UnknownError() => "Bilinmeyen bir hata meydana geldi."
    };
  }
}