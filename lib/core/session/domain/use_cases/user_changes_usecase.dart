
import 'package:firebase_app/core/session/domain/entity/user_entity.dart';
import 'package:firebase_app/core/session/domain/repo/session_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserChangesUsecase {
  final SessionRepo _sessionRepo;
  UserChangesUsecase(this._sessionRepo);

  Stream<UserEntity?> get userChanges => _sessionRepo.userChanges;
}