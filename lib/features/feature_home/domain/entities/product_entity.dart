
class ProductEntity {

  final String productId;
  final String categoryId;
  final bool isActive;
  final bool isCampaign;
  final String productImg;
  final String productName;
  final double productPrice;
  final String productTitle;

  ProductEntity({
    required this.productId,
    required this.categoryId,
    required this.isActive,
    required this.isCampaign,
    required this.productImg,
    required this.productName,
    required this.productPrice,
    required this.productTitle
  });
}