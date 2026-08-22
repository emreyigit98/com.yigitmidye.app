import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  
  final Widget child;
  final List<Widget>? actions;

  const AuthLayout({super.key, required this.child,this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              elevation: 0,
              floating: true,
               snap: true,
               actions: actions
              ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverToBoxAdapter(child: child),
            ),
          ],
        ),
      ),
    );
  }
}