import 'package:firebase_app/features/feature_home/data/models/category_model.dart';
import 'package:firebase_app/features/feature_home/data/models/product_model.dart';
import 'package:firebase_app/features/feature_home/domain/entities/category_entity.dart';
import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';

extension CategoryModelMapper on CategoryModel {
  CategoryEntity toCategoryModel() {
    return CategoryEntity(
      categoryId: categoryId,
      categoryName: categoryName,
      isActive: isActive,
      sort: sort,
    );
  }
}

extension ProductModelMapper on ProductModel {
  ProductEntity toProductEntity() {
    return ProductEntity(
      productId: productId,
      categoryId: categoryId,
      isActive: isActive,
      isCampaign: isCampaign,
      productImg: productImg,
      productName: productName,
      productPrice: productPrice,
      oldPrice: oldPrice,
      productTitle: productTitle,
    );
  }
}
