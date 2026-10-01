import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/feature_order/data/model/adress_model.dart';
import 'package:firebase_app/features/feature_order/data/model/payment_model.dart';
import 'package:firebase_app/features/feature_order/data/model/product_model.dart';
import 'package:firebase_app/features/feature_order/domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.orderId,
    required super.userId,
    required super.adress,
    required super.createdAt,
    required super.orderNote,
    required super.orderStatus,
    required super.payment,
    required super.phoneNumber,
    required super.products,
    required super.totalPrice,
  });

  factory OrderModel.fromFirebase(DocumentSnapshot document) {
    final snapshot = document.data() as Map<String, dynamic>;
    return OrderModel(
      orderId: snapshot["order_id"] ?? "",
      userId: snapshot["user_id"] ?? "",
      adress: AdressModel.fromMap(snapshot["adress"] ?? {}),
      createdAt: snapshot["created_at"] ?? Timestamp.now(),
      orderNote: snapshot["order_note"] ?? "",
      orderStatus: snapshot["order_status"] ?? "",
      payment: PaymentModel.fromMap(snapshot["payment"] ?? {}),
      phoneNumber: snapshot["phone_number"] ?? "",
      products: (snapshot["products"] as List<dynamic>? ?? [])
          .map((product) => ProductModel.fromMap(product))
          .toList(),
      totalPrice: (snapshot["total_price"] as num?)?.toDouble() ?? 0.0,
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      orderId: orderId,
      userId: userId,
      adress: adress,
      createdAt: createdAt,
      orderNote: orderNote,
      orderStatus: orderStatus,
      payment: payment,
      phoneNumber: phoneNumber,
      products: products,
      totalPrice: totalPrice,
    );
  }
}
