
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/core/session/data/data_source/session_datasource_repo.dart';
import 'package:firebase_app/core/session/domain/entity/user_entity.dart';
import 'package:firebase_app/core/session/domain/repo/session_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SessionRepo)
class SessionRepoImpl implements SessionRepo {

  final SessionDatasourceRepo _sessionDatasourceRepo;
  SessionRepoImpl(this._sessionDatasourceRepo);

  @override
  Stream<UserEntity?> get userChanges {
    return _sessionDatasourceRepo.userChanges.map((user) => user?.toEntity());
  }

  @override
  Future<Either<CustomException, Unit>> reolad() async {
    try {
      await _sessionDatasourceRepo.reolad();
      return Right(unit);
    }catch(e) {
      return Left(e.toCustomException());
    }
  }

  @override
  Future<Either<CustomException, Unit>> updateDisplayName(String name) async {
    try {
      await _sessionDatasourceRepo.updateDisplayname(name);
      return Right(unit);
    }catch(e) {
      return Left(e.toCustomException());
    }
  }

  @override
  Future<void> signOut() async {
    await _sessionDatasourceRepo.signOut();
  }
}