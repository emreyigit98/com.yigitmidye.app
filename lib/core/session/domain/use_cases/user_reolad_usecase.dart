
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/session/domain/repo/session_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserReoladUsecase {
  final SessionRepo _sessionRepo;
  UserReoladUsecase(this._sessionRepo);

  Future<Either<CustomException,Unit>> reolad() {
    return _sessionRepo.reolad();
  }
}