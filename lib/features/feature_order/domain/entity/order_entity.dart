
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/feature_order/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_order/domain/entity/payment_entity.dart';
import 'package:firebase_app/features/feature_order/domain/entity/product_entity.dart';
import 'package:intl/intl.dart';


class OrderEntity {

  final String orderId;
  final String userId;
  final AdressEntity adress;
  final Timestamp createdAt;
  final String orderNote;
  final String orderStatus;
  final PaymentEntity payment;
  final String phoneNumber;
  final List<ProductEntity> products;
  final double totalPrice;


  OrderEntity({
    required this.orderId,
    required this.userId,
    required this.adress,
    required this.createdAt,
    required this.orderNote,
    required this.orderStatus,
    required this.payment,
    required this.phoneNumber,
    required this.products,
    required this.totalPrice
  });

  String get formatterCreatedAt {
    return DateFormat("dd.MM.yyyy HH:mm").format(createdAt.toDate());
  }
}