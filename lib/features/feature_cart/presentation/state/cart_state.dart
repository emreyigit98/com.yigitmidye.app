
import 'package:equatable/equatable.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_product_model.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_status.dart';


class CartState extends Equatable {

  final List<CartProductModel> products;
  final CartStatus status;

  double get totalPrice {
    return products.fold(0, (sum,product) => sum + product.totalPrice);
  }

  const CartState({
    this.products = const [],
    this.status = const Idle()
  });


  CartState copyWith({
    List<CartProductModel>? products,
    CartStatus? status
  }) {
    return CartState(
      status: status ?? this.status,
      products: products ?? this.products
    );
  }

  @override
  List<Object?> get props => [products,status];
}