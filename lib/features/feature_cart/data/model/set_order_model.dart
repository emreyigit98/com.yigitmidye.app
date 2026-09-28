import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/set_order_entity.dart';

class SetOrderModel extends SetOrderEntity {
  SetOrderModel({
    required super.orderId,
    required super.products,
    required super.adress,
    required super.payment,
    required super.orderNote,
    required super.totalPrice,
  });

  factory SetOrderModel.fromEntity(SetOrderEntity entity) {
    return SetOrderModel(
      orderId: entity.orderId,
      products: entity.products,
      adress: entity.adress,
      payment: entity.payment,
      orderNote: entity.orderNote,
      totalPrice: entity.totalPrice,
    );
  }

  Map<String, dynamic> toJson(String userId, String phoneNumber) {
    return {
      "user_id": userId,
      "order_id": orderId,
      "products": products.map((product) => product.toMap()).toList(),
      "adress": adress.toMap(),
      "payment": payment.toMap(),
      "order_note": orderNote,
      "order_status": "Onay bekliyor",
      "total_price": totalPrice,
      "phone_number": phoneNumber,
      "created_at": FieldValue.serverTimestamp(),
    };
  }
}
