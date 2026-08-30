
import 'package:firebase_app/core/session/data/data_source/session_datasource_repo.dart';
import 'package:firebase_app/core/session/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SessionDatasourceRepo)
class SessionDatasourceRepoImpl implements SessionDatasourceRepo {

  final FirebaseAuth _firebaseAuth;
  SessionDatasourceRepoImpl(this._firebaseAuth);

  @override
  Stream<UserModel?> get userChanges {
    return _firebaseAuth.userChanges().map((firebaseUser) {
      if(firebaseUser == null) return null;
      return UserModel.fromUser(firebaseUser);
    });
  }

  @override
  Future<void> reolad() async {
    final currentUser = _firebaseAuth.currentUser;
    await currentUser?.reload();
  }

  @override
  Future<void> updateDisplayname(String name) async {
    final currentUser = _firebaseAuth.currentUser;
    if(currentUser == null) return;
    await currentUser.updateDisplayName(name);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}