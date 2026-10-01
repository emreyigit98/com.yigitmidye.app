import 'package:firebase_app/features/feature_order/domain/entity/order_entity.dart';
import 'package:firebase_app/features/feature_order/presentation/widget/card/product_card.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 16),
                    SizedBox(width: 4),
                    Text(
                      order.formatterCreatedAt,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    order.orderStatus,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.receipt_long_outlined, size: 16),
                      SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          "Sipariş no:#${order.orderId}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.location_on_outlined, size: 16),
                      Flexible(
                        child: Text(
                          "${order.adress.district}/${order.adress.neigh}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ...order.products.map((product) {
              return ProductCard(product: product);
            }),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.grey.shade200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Toplam Tutar",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${order.totalPrice.toStringAsFixed(2)}\u20ba",
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0XFFFA0351),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      children: [
                        Text("Detay",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Colors.white
                        )),
                        SizedBox(width: 6),
                        Icon(Icons.chevron_right_rounded,size: 20,color: Colors.white)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
