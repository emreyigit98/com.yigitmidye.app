import 'package:firebase_app/core/entity/payment_entity.dart';
import 'package:firebase_app/features/feature_cart/presentation/widgets/button/custom_radio_button.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final PaymentEntity entity;
  final bool selected;
  final VoidCallback onTap;

  const PaymentCard({
    super.key,
    required this.entity,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.grey.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? Colors.grey.shade500 : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomRadioButton(selected: selected),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.paymentType,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    entity.title,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(entity.icon, width: 80, height: 80, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
