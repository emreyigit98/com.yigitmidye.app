
import 'package:firebase_app/core/entity/payment_entity.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';

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

class GetAdressItemEvent extends CartEvent {
  const GetAdressItemEvent();
}

class SetOrderItemEvent extends CartEvent {
  const SetOrderItemEvent();
}

class UpdateAdressEvent extends CartEvent {
  final AdressEntity? entity;
  const UpdateAdressEvent(this.entity);
}

class UpdatePaymentEvent extends CartEvent {
  final PaymentEntity? entity;
  const UpdatePaymentEvent(this.entity);
}

class UpdateOrderNoteEvent extends CartEvent {
  final String orderNote;
  const UpdateOrderNoteEvent(this.orderNote);
}