
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_order/data/data_source/orders_datasource_repo.dart';
import 'package:firebase_app/features/feature_order/domain/entity/order_entity.dart';
import 'package:firebase_app/features/feature_order/domain/repo/order_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRepo)
class OrderRepoImpl extends OrderRepo {

  final OrdersDatasourceRepo _ordersDatasourceRepo;
  OrderRepoImpl(this._ordersDatasourceRepo);

  @override
  Future<Either<CustomException, List<OrderEntity>>> getOrders() async {
    try {
      final getOrders = await _ordersDatasourceRepo.getOrders();
      final orders = getOrders.map((order) => order.toEntity()).toList();
      return Right(orders);
    }catch(exception) {
      debugPrint("$exception");
      return Left(exception.toCustomException());
    }
  }
}