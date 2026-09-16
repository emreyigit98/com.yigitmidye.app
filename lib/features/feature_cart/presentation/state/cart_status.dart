
sealed class CartStatus { const CartStatus(); }

class Idle extends CartStatus { const Idle(); }

class CartItemsLoading extends CartStatus { const CartItemsLoading(); }
class CartItemsSuccess extends CartStatus {
  const CartItemsSuccess(); 
}
class CartItemsFailure extends CartStatus {
  final String exception;
  const CartItemsFailure(this.exception); 
}