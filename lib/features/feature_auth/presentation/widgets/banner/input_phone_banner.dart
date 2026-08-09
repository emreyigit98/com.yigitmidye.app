import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputPhoneBanner extends StatelessWidget {
  const InputPhoneBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/sec_icon.svg",width: 26,height: 26),
          SizedBox(width: 8),
          Text("Bilgileriniz güvende tutulur,üçüncü kişilerle paylaşılmaz")
        ],
      ),
    );
  }
}