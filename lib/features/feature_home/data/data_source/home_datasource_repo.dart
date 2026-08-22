import 'package:firebase_app/features/feature_home/data/models/category_model.dart';
import 'package:firebase_app/features/feature_home/data/models/product_model.dart';

abstract class HomeDatasourceRepo {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts();
}