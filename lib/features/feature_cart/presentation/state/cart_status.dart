
sealed class CartStatus { const CartStatus(); }

class CartIdle extends CartStatus { const CartIdle(); }

class CartItemsLoading extends CartStatus { const CartItemsLoading(); }
class CartItemsSuccess extends CartStatus {
  const CartItemsSuccess(); 
}

class CartItemsFailure extends CartStatus {
  final String exception;
  const CartItemsFailure(this.exception); 
}

class UploadCartItemSuccess extends CartStatus { const UploadCartItemSuccess();}

class UploadCartItemFailure extends CartStatus {
  final String exception;
  UploadCartItemFailure(this.exception);
}

class DeleteCartItemLoading extends CartStatus {
  const DeleteCartItemLoading();
}
class DeleteCartItemSuccess extends CartStatus {
  const DeleteCartItemSuccess();
}
class DeleteCartItemFailure extends CartStatus {
  final String exception;
  const DeleteCartItemFailure(this.exception);
}