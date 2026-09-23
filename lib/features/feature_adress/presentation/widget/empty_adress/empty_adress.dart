import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyAdress extends StatelessWidget {
  final VoidCallback onPressed;
  const EmptyAdress({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            "assets/lottie/location.json",
            width: 120,
            height: 120,
          ),
          SizedBox(height: 10),
          Text("Henüz bir adres eklemediniz",style: TextStyle(
            fontFamily: "Inter",
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold
          )),
          SizedBox(height: 10),
          Text("Siparişlerinizi verebilmek için ilk adresinizi ekleyin.",style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400
          )),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFFFA0351),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onPressed,
            child: Text("Adres ekle"),
          ),
        ],
      ),
    );
  }
}