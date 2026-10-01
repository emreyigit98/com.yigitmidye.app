
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_order/domain/entity/order_entity.dart';

abstract class OrderRepo {
  Future<Either<CustomException,List<OrderEntity>>> getOrders();
}