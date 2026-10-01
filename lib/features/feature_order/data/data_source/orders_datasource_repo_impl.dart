
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/core/constants/constants.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_order/data/data_source/orders_datasource_repo.dart';
import 'package:firebase_app/features/feature_order/data/model/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrdersDatasourceRepo)
class OrdersDatasourceRepoImpl implements OrdersDatasourceRepo {

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  OrdersDatasourceRepoImpl(this._firebaseAuth,this._firebaseFirestore);

  @override
  Future<List<OrderModel>> getOrders() async {
    final user = _firebaseAuth.currentUser;
    if(user == null) throw UserNotFound();
    final orders = await _firebaseFirestore.collection(Constants.orders)
      .where(Constants.userId,isEqualTo: user.uid)
      .orderBy(Constants.createdAt,descending: true)
      .limit(10)
      .get();
    return orders.docs.map((document) => OrderModel.fromFirebase(document)).toList();
  }
}