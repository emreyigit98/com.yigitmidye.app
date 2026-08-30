import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {

  final VoidCallback onTap;

  const LoginHeader({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Yiğit Midye'ye hoş geldin!",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Inter",
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Siparişlerinizi kolayca oluşturmak için giriş yapın.",
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Inter",
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Color(0XFFFA0351),
                foregroundColor: Colors.white,
              ),
              onPressed: onTap,
              child: Text("Giriş yap"),
            ),
          ),
        ],
      ),
    );
  }
}