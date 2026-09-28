
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/set_order_entity.dart';
import 'package:firebase_app/features/feature_cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetOrderUsecase {

  final CartRepo _repo;
  SetOrderUsecase(this._repo);

  Future<Either<CustomException,Unit>> setOrderItem(SetOrderEntity entity) {
    return _repo.setOrderItem(entity);
  }
}