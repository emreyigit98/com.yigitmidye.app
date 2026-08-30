
import 'package:flutter/material.dart';


class UpdateMessage extends StatelessWidget {
  final VoidCallback onTap;
  const UpdateMessage({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text("Size nasıl hitap edelim?",style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w700
          )),
          SizedBox(width: 8),
          Icon(Icons.arrow_drop_down_rounded,color: Colors.black)
        ],
      ),
    );
  }
}