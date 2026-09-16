import 'package:firebase_app/features/feature_cart/domain/entity/cart_product_model.dart';
import 'package:flutter/material.dart';

class CartProductCart extends StatelessWidget {
  final CartProductModel product;

  const CartProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.productImg,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.productName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    )),
                    product.isDiscountActive ? Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text("Kampanya'lı ürün %${product.discount} indirim",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.w600
                      )),
                    ),
                    ) : Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                         padding: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                         decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text("Kampanyasız ürün",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.w600
                      )),
                      ),
                    ),
                    Text("${product.totalPrice.toStringAsFixed(2)} \u20ba",style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              height: 82,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever_outlined),
                  ),
                  Material(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.remove_rounded),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Text(product.quantity.toString()),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.add_rounded),
                          ),
                        ),
                      ],
                    ),
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