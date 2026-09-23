
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCartItemUsecase {

  final CartRepo _cartRepo;
  DeleteCartItemUsecase(this._cartRepo);

  Future<Either<CustomException,Unit>> deleteCartItem(String productId) {
    return _cartRepo.deleteCartItem(productId);
  }
}