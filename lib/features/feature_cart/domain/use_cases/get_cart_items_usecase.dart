
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_product_model.dart';
import 'package:firebase_app/features/feature_cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCartItemsUsecase {

  final CartRepo _cartRepo;
  GetCartItemsUsecase(this._cartRepo);

  Future<Either<CustomException,List<CartProductModel>>> getCartProductItems() {
    return _cartRepo.getCartProductItems();
  }
}