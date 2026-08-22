import 'package:firebase_app/features/feature_home/domain/entities/category_entity.dart';
import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';

class HomeEntity {
  
  final List<CategoryEntity> categories;
  final List<ProductEntity> products;
  final CategoryEntity initialCategory;

  HomeEntity({required this.categories, required this.products,required this.initialCategory});
}
