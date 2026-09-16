
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_entity.dart';
import 'package:firebase_app/features/feature_cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetCartItemUsecase {

  final CartRepo _cartRepo;
  SetCartItemUsecase(this._cartRepo);

  Future<Either<CustomException,Unit>> setCartItem(CartEntity cartEntity) {
    return _cartRepo.setCartItem(cartEntity);
  }
}