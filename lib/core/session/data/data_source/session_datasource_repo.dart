
import 'package:firebase_app/core/session/data/model/user_model.dart';

abstract class SessionDatasourceRepo {

  Stream<UserModel?> get userChanges;

  Future<void> reolad();

  Future<void> updateDisplayname(String name);

  Future<void> signOut();

}