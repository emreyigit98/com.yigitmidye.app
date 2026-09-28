import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:firebase_app/core/entity/payment_entity.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_product_model.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/adress_status.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_status.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/order_status.dart';

class CartState extends Equatable {

  final List<CartProductModel> products;
  final List<AdressEntity> adresses;

  final AdressStatus adressStatus;
  final CartStatus cartStatus;
  final OrderStatus orderStatus;
  
  final String orderNote;
  final AdressEntity? entity;
  final PaymentEntity? payment;

  double get totalPrice {
    return products.fold(0, (sum, product) => sum + product.totalPrice);
  }

  String get orderIdGenerator {
    final timesTemp = DateTime.now().millisecondsSinceEpoch;
    final randomId = Random().nextInt(400) + 100;
    return "YM$timesTemp$randomId";
  }

  const CartState({
    this.products = const [],
    this.adresses = const [],
    this.cartStatus = const CartIdle(),
    this.adressStatus = const AdressIdle(),
    this.orderStatus = const OrderIdle(),
    this.orderNote = "",
    this.entity,
    this.payment,
  });

  CartState copyWith({
    List<CartProductModel>? products,
    List<AdressEntity>? adresses,
    CartStatus? cartStatus,
    AdressStatus? adressStatus,
    OrderStatus? orderStatus,
    String? orderNote,
    AdressEntity? entity,
    PaymentEntity? payment,
  }) {
    return CartState(
      cartStatus: cartStatus ?? this.cartStatus,
      adressStatus: adressStatus ?? this.adressStatus,
      orderStatus: orderStatus ?? this.orderStatus,
      products: products ?? this.products,
      adresses: adresses ?? this.adresses,
      entity: entity ?? this.entity,
      payment: payment ?? this.payment,
      orderNote: orderNote ?? this.orderNote
    );
  }

  @override
  List<Object?> get props => [
    products,
    adresses,
    cartStatus,
    adressStatus,
    orderStatus,
    entity,
    payment,
    orderNote
  ];
}