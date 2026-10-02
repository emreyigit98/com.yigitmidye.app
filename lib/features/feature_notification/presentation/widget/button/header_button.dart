import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final VoidCallback onTop;
  final String text;
  const HeaderButton({super.key, required this.onTop, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFA0351),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onTop,
      child: Text(text),
    );
  }
}
