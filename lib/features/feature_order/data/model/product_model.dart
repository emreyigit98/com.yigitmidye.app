import 'package:firebase_app/features/feature_order/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.productId,
    required super.isActive,
    required super.isCampaign,
    required super.oldPrice,
    required super.productImg,
    required super.productPrice,
    required super.productName,
    required super.productTitle,
    required super.quantity,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map["product_id"] ?? "",
      isActive: map["is_active"] ?? false,
      isCampaign: map["is_campaign"] ?? false,
      oldPrice: (map["old_price"] as num?)?.toDouble() ?? 0.0,
      productImg: map["product_img"] ?? "",
      productPrice: (map["product_price"] as num?)?.toDouble() ?? 0.0,
      productName: map["product_name"] ?? "",
      productTitle: map["product_title"] ?? "",
      quantity: map["quantity"] ?? 0,
    );
  }
}
