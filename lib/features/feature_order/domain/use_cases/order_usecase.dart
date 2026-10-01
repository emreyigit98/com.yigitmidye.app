
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_order/domain/entity/order_entity.dart';
import 'package:firebase_app/features/feature_order/domain/repo/order_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OrderUsecase {
  final OrderRepo _orderRepo;

  OrderUsecase(this._orderRepo);

  Future<Either<CustomException,List<OrderEntity>>> getOrders() {
    return _orderRepo.getOrders();
  }
}