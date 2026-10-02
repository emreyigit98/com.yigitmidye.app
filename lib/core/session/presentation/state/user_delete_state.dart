
sealed class UserDeleteState { const UserDeleteState(); }

class Idle extends UserDeleteState { const Idle(); }

class UserDeleteLoading extends UserDeleteState { const UserDeleteLoading(); }

class UserDeleteSuccess extends UserDeleteState { const UserDeleteSuccess(); }

class UserDeleteFailure extends UserDeleteState {
  final String message;
  const UserDeleteFailure(this.message);
}