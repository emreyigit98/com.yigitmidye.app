
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/session/domain/repo/session_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserDeleteUsecase {
  final SessionRepo _sessionRepo;

  UserDeleteUsecase(this._sessionRepo);

  Future<Either<CustomException,Unit>> userDelete() {
    return _sessionRepo.userDelete();
  }
}