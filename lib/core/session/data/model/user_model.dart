import 'package:firebase_app/core/session/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class UserModel extends UserEntity {
  
  UserModel({
    required super.uid,
    required super.phoneNumber,
    super.displayName,
    required super.createdAt,
  });

  factory UserModel.fromUser(firebase.User firebaseUser) {
    return UserModel(
      uid: firebaseUser.uid,
      phoneNumber: firebaseUser.phoneNumber ?? "",
      displayName: firebaseUser.displayName,
      createdAt: firebaseUser.metadata.creationTime,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      phoneNumber: phoneNumber,
      displayName: displayName,
      createdAt: createdAt,
    );
  }
}
