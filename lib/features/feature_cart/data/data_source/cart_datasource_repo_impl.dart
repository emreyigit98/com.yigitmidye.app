
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/core/constants/constants.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_cart/data/data_source/cart_datasource_repo.dart';
import 'package:firebase_app/features/feature_cart/data/model/cart_model.dart';
import 'package:firebase_app/features/feature_cart/data/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartDatasourceRepo)
class CartDatasourceRepoImpl implements CartDatasourceRepo {

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  CartDatasourceRepoImpl(this._firebaseAuth,this._firebaseFirestore);

  @override
  Future<void> setCartItem(CartModel cartModel) async {
    final user = _firebaseAuth.currentUser;
    if(user == null) throw UserNotFound();
    await _firebaseFirestore.collection(Constants.users).doc(user.uid)
      .collection(Constants.cart).doc(cartModel.id).set(cartModel.toJson(),SetOptions(merge: true));
  }

  @override
  Future<List<CartModel>> getCartItems() async {
    final user = _firebaseAuth.currentUser;
    if(user == null) throw UserNotFound();
    final cartItems = await _firebaseFirestore.collection(Constants.users).doc(user.uid)
      .collection(Constants.cart).get(GetOptions(source: Source.serverAndCache));
    return cartItems.docs.map((document) => CartModel.fromFirestore(document)).toList();  
  }

  @override
  Future<List<ProductModel>> getProductItems(List<String> productIds) async {
   final productItems =  await _firebaseFirestore.collection(Constants.products)
    .where("is_active",isEqualTo: true)
    .where(FieldPath.documentId,whereIn: productIds).get(GetOptions(source: Source.server));
    return productItems.docs.map((document) => ProductModel.fromFirebase(document)).toList();
  }

  @override
  Stream<int> cartCount() {
    final user = _firebaseAuth.currentUser;
    if(user == null) {
      return Stream.value(0);
    }
    return _firebaseFirestore.collection(Constants.users).doc(user.uid)
    .collection(Constants.cart).snapshots().map((snap) => snap.size);
  }
}