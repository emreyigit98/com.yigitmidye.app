import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_cart/data/data_source/cart_datasource_repo.dart';
import 'package:firebase_app/features/feature_cart/data/model/cart_model.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_product_model.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_entity.dart';
import 'package:firebase_app/features/feature_cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartDatasourceRepo _cartDatasourceRepo;
  CartRepoImpl(this._cartDatasourceRepo);

  @override
  Future<Either<CustomException, Unit>> setCartItem(CartEntity cartEntity) async {
    try {
      await _cartDatasourceRepo.setCartItem(CartModel.toEntity(cartEntity));
      return Right(unit);
    } catch (exception) {
      return Left(exception.toCustomException());
    }
  }

  @override
  Future<Either<CustomException, List<CartProductModel>>> getCartProductItems() async {

    try {

      final cartItems = await _cartDatasourceRepo.getCartItems();

      if(cartItems.isEmpty) return Right([]);

      final ids = {for (var cartItem in cartItems) cartItem.id: cartItem};
      final productItems = await _cartDatasourceRepo.getProductItems(ids.keys.toList());

      final cartProductItems = productItems.map((product) {

        final cartItem = ids[product.productId];

        return CartProductModel(
          productId: product.productId,
          isActive: product.isActive,
          isCampaign: product.isCampaign,
          productImg: product.productImg,
          oldPrice: product.oldPrice,
          productName: product.productName,
          productPrice: product.productPrice,
          productTitle: product.productTitle,
          quantity: cartItem?.quantity ?? 1
        );
        
      }).toList();

      return Right(cartProductItems);

    } catch (exception) {
      return Left(exception.toCustomException());
    }
  }

  @override
  Stream<int> cartCount() => _cartDatasourceRepo.cartCount();
}