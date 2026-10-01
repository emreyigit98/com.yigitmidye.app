import 'package:firebase_app/features/feature_order/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        product.productImg,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.productName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${product.quantity} adet",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${product.totalPrice.toStringAsFixed(2)}\u20ba",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
