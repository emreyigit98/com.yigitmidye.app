import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/core/constants/constants.dart';
import 'package:firebase_app/features/feature_home/data/data_source/home_datasource_repo.dart';
import 'package:firebase_app/features/feature_home/data/models/category_model.dart';
import 'package:firebase_app/features/feature_home/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeDatasourceRepo)
class HomeDatasourceRepoImpl implements HomeDatasourceRepo {
  final FirebaseFirestore _firebaseFirestore;
  HomeDatasourceRepoImpl(this._firebaseFirestore);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categories = await _firebaseFirestore
        .collection(Constants.categories).where("is_active",isEqualTo: true)
        .orderBy("sort")
        .get(GetOptions(source: Source.serverAndCache));
    return categories.docs
        .map((doc) => CategoryModel.fromFirestore(doc))
        .toList();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final products = await _firebaseFirestore
        .collection(Constants.products).where("is_active",isEqualTo: true)
        .orderBy("product_price", descending: false)
        .get(GetOptions(source: Source.serverAndCache));
    return products.docs.map((doc) => ProductModel.fromFirebase(doc)).toList();
  }
}