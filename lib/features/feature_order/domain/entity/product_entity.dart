
class ProductEntity {

  final String productId;
  final bool isActive;
  final bool isCampaign;
  final double oldPrice;
  final String productImg;
  final String productName;
  final String productTitle;
  final double productPrice;
  final int quantity;

  ProductEntity({
    required this.productId,
    required this.isActive,
    required this.isCampaign,
    required this.oldPrice,
    required this.productImg,
    required this.productName,
    required this.productTitle,
    required this.productPrice,
    required this.quantity
  });

  double get totalPrice {
    return productPrice * quantity;
  }
}