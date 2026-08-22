import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputPhoneBanner extends StatelessWidget {
  const InputPhoneBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade400, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/sec_icon.svg", width: 24, height: 24),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Kişisel verileriniz gizlilik politiamıza uygun olarak korunur; numaranız yalnızca doğrulama ve sipariş iletişimi amacıyla işlenir.",
            ),
          ),
        ],
      ),
    );
  }
}