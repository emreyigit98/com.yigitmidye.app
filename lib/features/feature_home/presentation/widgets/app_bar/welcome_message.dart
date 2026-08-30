
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeMessage extends StatelessWidget {
  final String displayName;

  const WelcomeMessage({super.key,required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("İyi akşamlar,$displayName 👋",style: TextStyle(
          fontFamily: "Inter",
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.black
        )),
        SizedBox(height: 2),
        Text("Canın midye çekiyorsa doğru yerdesin. 🦪",style: TextStyle(
          fontFamily: "Inter",
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w400
        ))
      ],
    );
  }
}