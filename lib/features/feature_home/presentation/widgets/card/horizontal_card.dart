import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  final VoidCallback onTap;
  final ProductEntity productEntity;
  const HorizontalCard({super.key,required this.onTap,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(productEntity.productImg,fit: BoxFit.cover,),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(productEntity.productName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Inter",
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text("${productEntity.productPrice.toStringAsFixed(2)} \u20BA",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Inter",
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
