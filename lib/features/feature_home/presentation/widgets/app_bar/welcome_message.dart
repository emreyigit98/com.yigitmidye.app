
import 'package:firebase_app/core/util/welcome_message.dart';
import 'package:flutter/material.dart';


class WelcomeMessage extends StatelessWidget {
  
  final String displayName;

  const WelcomeMessage({super.key,required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${welcomeMessage()},$displayName 👋",style: TextStyle(
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