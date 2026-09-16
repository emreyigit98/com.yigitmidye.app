
sealed class SetCartState { const SetCartState(); }

class Idle extends SetCartState { const Idle(); }
class SetCartLoading extends SetCartState { const SetCartLoading(); }
class SetCartSuccess extends SetCartState { const SetCartSuccess(); }
class SetCartError extends SetCartState { 
  final String message;
  const SetCartError(this.message);
}