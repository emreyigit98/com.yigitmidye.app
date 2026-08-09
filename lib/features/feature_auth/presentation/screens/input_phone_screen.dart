import 'package:firebase_app/features/feature_auth/presentation/widgets/banner/input_phone_banner.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/button/auth_button.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/icon/auth_icon.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/layout/auth_layout.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/spacing/auth_spacing.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/text/auth_title.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/text_field/input_phone_textfield.dart';
import 'package:flutter/material.dart';

class InputPhoneScreen extends StatefulWidget {
  const InputPhoneScreen({super.key});

  @override
  State<InputPhoneScreen> createState() => _InputPhoneScreenState();
}

class _InputPhoneScreenState extends State<InputPhoneScreen> {
  final phoneController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AuthIcon(),
            AuthSpacing(),
            AuthTitle(
              title: "Cep numaran nedir?",
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            AuthTitle(
              title: "Devam etmek için cep numaranızı girin",
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            AuthSpacing(),
            InputPhoneTextfield(
              phoneController: phoneController,
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "telefon giriş alanı boş bırakılamaz";
                }
                if(value.length < 10) {
                  return "telefon numarası 10 haneden küçük olamaz";
                }
                return null;
              },
            ),
            AuthSpacing(),
            AuthButton(onPressed: () {}, child: Text("Devam et")),
            AuthSpacing(),
            InputPhoneBanner()
          ],
        ),
      ),
    );
  }
}