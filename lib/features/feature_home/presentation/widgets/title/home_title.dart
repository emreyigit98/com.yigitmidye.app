import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  const HomeTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(child: Text(title,style: TextStyle(
        fontFamily: "Inter",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ))),
    );
  }
}
