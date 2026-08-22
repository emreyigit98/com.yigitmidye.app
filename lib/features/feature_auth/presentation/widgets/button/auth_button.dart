import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const AuthButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color(0XFFFA0351);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
