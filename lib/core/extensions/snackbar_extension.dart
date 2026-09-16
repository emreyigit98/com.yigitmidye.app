
import 'package:flutter/material.dart';

extension ShowSnackBarExtension on BuildContext {

  void showSnackBar({required String message}) {

    ScaffoldMessenger.of(this).clearSnackBars();

    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12)
      ),
      backgroundColor: Color(0xFF1E293B),
      content: Text(message,style: TextStyle(
        fontFamily: "Inter",
        color: Colors.white,
        fontWeight: FontWeight.w500
      ),))
    );
  }
}