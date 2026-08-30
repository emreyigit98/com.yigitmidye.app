import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final VoidCallback onTap;
  final ProductEntity productEntity;
  const GridCard({super.key, required this.onTap, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                productEntity.productImg,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            productEntity.productName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Inter",
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "${productEntity.productPrice.toStringAsFixed(2)} \u20Ba",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Inter",
              color: Color(0XFFFA0351),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}