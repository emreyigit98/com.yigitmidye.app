import 'package:flutter/material.dart';

class LoginMessage extends StatelessWidget {
  final VoidCallback onTap;

  const LoginMessage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "🦪 Yiğit Midye'ye hoş geldiniz",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 2),
          Text(
            "Giriş yap, siparişini hemen oluştur.",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}