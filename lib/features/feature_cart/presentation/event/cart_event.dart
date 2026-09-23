
sealed class CartEvent { const CartEvent(); }

class GetCartItemsEvent extends CartEvent { const GetCartItemsEvent(); }

class UploadCartItemsEvent extends CartEvent {
  final String productId;
  final int quantity;
  const UploadCartItemsEvent({
    required this.productId,
    required this.quantity
  });
}

class UpdateCartItemEvent extends CartEvent {
  final String productId;
  final int quantity;
  const UpdateCartItemEvent({
    required this.productId,
    required this.quantity
  });
}

class DeleteCartItemEvent extends CartEvent {
  final String productId;
  const DeleteCartItemEvent(this.productId);
}

class GetAdressItemEvent extends CartEvent {}