
import 'package:firebase_app/features/feature_home/domain/entities/category_entity.dart';
import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';


class HomeState {

  final List<CategoryEntity> categories;
  final List<ProductEntity> products;
  final CategoryEntity? initialCategory;

  List<ProductEntity> get filterProducts => products.where((product) => product.categoryId == initialCategory?.categoryId).toList();
  
  List<ProductEntity> get campaignProducts => products.where((product) => product.isCampaign).toList();

  HomeState({
    this.categories = const [],
    this.products = const [],
    this.initialCategory
  });

  HomeState copyWith({
    List<CategoryEntity>? categories,
    List<ProductEntity>? products,
    CategoryEntity? initialCategory
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      initialCategory: initialCategory ?? this.initialCategory
    );
  }
}