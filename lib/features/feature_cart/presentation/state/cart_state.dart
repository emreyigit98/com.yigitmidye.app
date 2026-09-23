
import 'package:equatable/equatable.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_product_model.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/adress_status.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_status.dart';


class CartState extends Equatable {

  final List<CartProductModel> products;
  final List<AdressEntity> adresses;
  final AdressStatus adressStatus;
  final CartStatus cartStatus;
  final AdressEntity? entity;

  double get totalPrice {
    return products.fold(0, (sum,product) => sum + product.totalPrice);
  }

  const CartState({
    this.products = const [],
    this.adresses = const [],
    this.cartStatus = const CartIdle(),
    this.adressStatus = const AdressIdle(),
    this.entity
  });

  CartState copyWith({
    List<CartProductModel>? products,
    List<AdressEntity>? adresses,
    CartStatus? cartStatus,
    AdressStatus? adressStatus,
    AdressEntity? entity
  }) {
    return CartState(
      cartStatus: cartStatus ?? this.cartStatus,
      adressStatus: adressStatus ?? this.adressStatus,
      products: products ?? this.products,
      adresses: adresses ?? this.adresses,
      entity: entity ?? this.entity
    );
  }

  @override
  List<Object?> get props => [products,adresses,cartStatus,adressStatus,entity];
}