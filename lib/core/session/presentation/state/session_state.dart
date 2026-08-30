
import 'package:firebase_app/core/session/domain/entity/user_entity.dart';

sealed class SessionState { const SessionState(); }

class Idle extends SessionState { const Idle(); }

class Authenticated extends SessionState {
  final UserEntity user;
  const Authenticated(this.user);
}

class Unauthenticated extends SessionState {
  const Unauthenticated();
}

class ReoladFailed extends SessionState {
  final String message;
  const ReoladFailed(this.message);
}