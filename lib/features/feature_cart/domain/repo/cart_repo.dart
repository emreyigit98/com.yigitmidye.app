
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_product_model.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_entity.dart';

abstract class CartRepo {
  Future<Either<CustomException,Unit>> setCartItem(CartEntity cartEntity);
  Future<Either<CustomException,List<CartProductModel>>> getCartProductItems();
  Future<Either<CustomException,Unit>> deleteCartItem(String productId);
  Stream<int> cartCount();
}