class CartProductModel {
  
  final String productId;
  final bool isActive;
  final bool isCampaign;
  final String productImg;
  final String productName;
  final double productPrice;
  final double oldPrice;
  final String productTitle;
  final int quantity;

  double get totalPrice => productPrice * quantity;

  bool get isDiscountActive => productPrice < oldPrice;

  int get discount {
    final discountPrice = oldPrice - productPrice;
    return ((discountPrice / oldPrice) * 100 ).round();
  }

  CartProductModel({
    required this.productId,
    required this.isActive,
    required this.isCampaign,
    required this.productImg,
    required this.oldPrice,
    required this.productName,
    required this.productPrice,
    required this.productTitle,
    required this.quantity,
  });

  CartProductModel copyWith({int? quantity}) {
    return CartProductModel(
      productId: productId,
      isActive: isActive,
      isCampaign: isCampaign,
      productImg: productImg,
      oldPrice: oldPrice,
      productName: productName,
      productPrice: productPrice,
      productTitle: productTitle,
      quantity: quantity ?? this.quantity,
    );
  }
}