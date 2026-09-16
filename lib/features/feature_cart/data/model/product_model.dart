
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  
  final String productId;
  final String categoryId;
  final bool isActive;
  final bool isCampaign;
  final String productImg;
  final String productName;
  final double productPrice;
  final double oldPrice;
  final String productTitle;

  ProductModel({
    required this.productId,
    required this.categoryId,
    required this.isActive,
    required this.isCampaign,
    required this.productImg,
    required this.productName,
    required this.productPrice,
    required this.oldPrice,
    required this.productTitle,
  });

  factory ProductModel.fromFirebase(DocumentSnapshot doc) {
    final snapshot = doc.data() as Map<String, dynamic>?;
    return ProductModel(
      productId: doc.id,
      categoryId: snapshot?["category_id"] ?? "",
      isActive: snapshot?["is_active"] ?? false,
      isCampaign: snapshot?["is_campaign"] ?? false,
      productImg: snapshot?["product_img"] ?? "",
      productName: snapshot?["product_name"] ?? "",
      productPrice: snapshot?["product_price"] ?? 0.0,
      oldPrice: snapshot?["old_price"] ?? 0.0,
      productTitle: snapshot?["product_title"] ?? "",
    );
  }
}