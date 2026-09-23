
import 'package:firebase_app/features/feature_cart/data/model/cart_model.dart';
import 'package:firebase_app/features/feature_cart/data/model/product_model.dart';

abstract class CartDatasourceRepo {
  Future<void> setCartItem(CartModel cartModel);
  Future<List<CartModel>> getCartItems();
  Future<List<ProductModel>> getProductItems(List<String> productIds);
  Future<void> deleteCartItem(String productId);
  Stream<int> cartCount();
}