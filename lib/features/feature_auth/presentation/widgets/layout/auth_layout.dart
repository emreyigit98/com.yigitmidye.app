import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(floating: true, snap: true),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: child,
            ),
          ],
        ),
      ),
    );
  }
}