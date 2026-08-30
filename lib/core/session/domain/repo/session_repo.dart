import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/session/domain/entity/user_entity.dart';

abstract class SessionRepo {
  Stream<UserEntity?> get userChanges;
  
  Future<Either<CustomException,Unit>> reolad();

  Future<Either<CustomException,Unit>> updateDisplayName(String name);

  Future<void> signOut();
}