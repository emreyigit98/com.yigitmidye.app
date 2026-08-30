
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/session/domain/repo/session_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateNameUsecase {
  final SessionRepo _sessionRepo;
  UpdateNameUsecase(this._sessionRepo);

  Future<Either<CustomException,Unit>> updateDisplayName(String name) {
    return _sessionRepo.updateDisplayName(name);
  }
}