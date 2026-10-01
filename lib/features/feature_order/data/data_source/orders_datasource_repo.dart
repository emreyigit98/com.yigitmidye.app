
import 'package:firebase_app/features/feature_order/data/model/order_model.dart';

abstract class OrdersDatasourceRepo {
  Future<List<OrderModel>> getOrders();
}