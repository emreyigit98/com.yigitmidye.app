
import 'package:firebase_app/features/feature_order/domain/entity/order_entity.dart';

sealed class OrderState { const OrderState(); }

class GetOrderIdle extends OrderState { const GetOrderIdle(); }

class GetOrderLoading extends OrderState { const GetOrderLoading(); }

class GetOrderSuccess extends OrderState { 
  final List<OrderEntity> orders;
  const GetOrderSuccess(this.orders);
}

class GetOrderFailure extends OrderState {
  final String message;
  const GetOrderFailure(this.message);
}