import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/main_logo.svg",width: 80,height: 80),
          SizedBox(height: 26),
          Lottie.asset("assets/lottie/loading.json",width: 70,height: 70,repeat: true),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () {
            context.go("/input-phone");
          }, child: Text("Devam et"))
        ],
      ))),
    );
  }
}