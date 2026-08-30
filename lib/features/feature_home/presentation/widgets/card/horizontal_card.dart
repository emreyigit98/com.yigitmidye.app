import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {
  final VoidCallback onTap;
  final ProductEntity productEntity;
  const HorizontalCard({
    super.key,
    required this.onTap,
    required this.productEntity,
  });

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
            Row(
              children: [
                Text(
                  "${productEntity.productPrice.toStringAsFixed(2)} \u20BA",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0XFFFA0351),
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "${productEntity.oldPrice.toStringAsFixed(2)} \u20BA",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.lineThrough
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text(
                "${productEntity.discount}% indirim",
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 10
                ),
                ),
            )
          ],
        ),
      ),
    );
  }
}