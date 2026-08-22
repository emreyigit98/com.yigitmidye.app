
import 'package:flutter/material.dart';

class HomeSpacing extends StatelessWidget {
  const HomeSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: 10));
  }
}