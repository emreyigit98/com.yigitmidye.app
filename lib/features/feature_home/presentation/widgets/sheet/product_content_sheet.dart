import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProductSheetContent extends StatefulWidget {
  final ProductEntity product;
  const ProductSheetContent({super.key, required this.product});

  @override
  State<ProductSheetContent> createState() => _ProductSheetContentState();
}

class _ProductSheetContentState extends State<ProductSheetContent> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final totalPrice = count * widget.product.productPrice;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 220,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          widget.product.productImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.productName,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.product.productTitle,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Toplam tutar",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("${totalPrice.toStringAsFixed(2)} \u20Ba"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: count > 1
                                ? () {
                                    setState(() {
                                      if (count > 1) {
                                        count--;
                                      }
                                    });
                                  }
                                : null,
                            icon: SvgPicture.asset(
                              "assets/icons/minus_icon.svg",
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                count <= 1
                                    ? Colors.grey.shade600
                                    : Colors.black,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text("$count"),
                          SizedBox(width: 4),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                count++;
                              });
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/plus_icon.svg",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Color(0xFFFA0351),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          
                        },
                        child: Text("Sepete ekle"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
