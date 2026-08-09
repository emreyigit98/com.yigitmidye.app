import 'package:firebase_app/features/feature_auth/presentation/widgets/icon/auth_icon.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/layout/auth_layout.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/spacing/auth_spacing.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/text/auth_title.dart';
import 'package:firebase_app/features/feature_auth/presentation/widgets/text_field/input_otp_textfield.dart';
import 'package:flutter/material.dart';

class InputOtpScreen extends StatefulWidget {
  const InputOtpScreen({super.key});

  @override
  State<InputOtpScreen> createState() => _InputOtpScreenState();
}

class _InputOtpScreenState extends State<InputOtpScreen> {

  final otpController = TextEditingController();
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
              title: "Giriş bilgilerini doğrulamamıza yardımcı olun",
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            AuthSpacing(),
            AuthTitle(
              title: "için bir doğrulama kodu gönderdik",
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            AuthSpacing(),
            AuthTitle(
              title: "lütfen kodu aşşağıya girin",
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            AuthSpacing(),
            InputOtpTextfield(
              otpController: otpController,
              validator: (value) {
                if(value == null || value.trim().isEmpty) {
                  return "kod girme alanı boş bırakılamaz";
                }
                if(value.length < 6) {
                  return "sms kodu 6 haneden küçük olamaz";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
