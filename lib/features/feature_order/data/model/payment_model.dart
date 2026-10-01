
import 'package:firebase_app/features/feature_order/domain/entity/payment_entity.dart';

class PaymentModel extends PaymentEntity {

  PaymentModel({
    required super.paymentType
  });

  factory PaymentModel.fromMap(Map<String,dynamic> map) {
    return PaymentModel(paymentType: map["payment_type"] ?? "");
  }
}