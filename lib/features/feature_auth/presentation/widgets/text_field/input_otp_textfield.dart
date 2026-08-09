import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class InputOtpTextfield extends StatelessWidget {

  final TextEditingController otpController;
  final String? Function(String?)? validator;

  const InputOtpTextfield({super.key,required this.otpController,required this.validator});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      controller: otpController,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      defaultPinTheme: PinTheme(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1),
          borderRadius: BorderRadius.circular(12)
        )
      ),
      focusedPinTheme: PinTheme(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 1),
          borderRadius: BorderRadius.circular(12)
        )
      ),
      errorPinTheme: PinTheme(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red,width: 1),
          borderRadius: BorderRadius.circular(12)
        )
      ),
      errorTextStyle: TextStyle(
        color: Colors.red,
        fontSize: 8
      ),
      validator: validator,
    );
  }
}