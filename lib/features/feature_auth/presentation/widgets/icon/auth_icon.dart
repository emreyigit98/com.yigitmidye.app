import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthIcon extends StatelessWidget {
  const AuthIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/icons/login_icon.svg",width: 80,height: 80);
  }
}