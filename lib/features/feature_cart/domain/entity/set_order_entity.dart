
import 'package:firebase_app/core/entity/payment_entity.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_product_model.dart';

class SetOrderEntity {

  final String orderId;
  final List<CartProductModel> products;
  final AdressEntity adress;
  final PaymentEntity payment;
  final String orderNote;
  final double totalPrice;


  SetOrderEntity({
    required this.orderId,
    required this.products,
    required this.adress,
    required this.payment,
    required this.orderNote,
    required this.totalPrice
  });
}