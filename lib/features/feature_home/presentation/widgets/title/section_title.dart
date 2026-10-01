
import 'package:flutter/material.dart';


class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        color: Colors.grey,
      ),
    ),
  );
  }
}