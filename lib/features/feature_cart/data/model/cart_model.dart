
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_entity.dart';

class CartModel extends CartEntity {

  CartModel({
    required super.id,
    required super.quantity
  });

  factory CartModel.fromFirestore(DocumentSnapshot document) {
    final snapshot = document.data() as Map<String,dynamic>?;
    return CartModel(id: document.id, quantity: snapshot?["quantity"] ?? 1);
  }

  factory CartModel.toEntity(CartEntity cartEntity) {
    return CartModel(id: cartEntity.id, quantity: cartEntity.quantity);
  }

  Map<String,dynamic> toJson() {
    return {
      "quantity" : quantity
    };
  }
}