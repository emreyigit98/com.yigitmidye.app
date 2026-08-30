
import 'package:firebase_app/core/session/domain/repo/session_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserSignoutUsecase {
  final SessionRepo _sessionRepo;
  UserSignoutUsecase(this._sessionRepo);

  Future<void> signOut() => _sessionRepo.signOut();
}