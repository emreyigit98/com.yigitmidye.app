
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputPhoneTextfield extends StatelessWidget {

  final TextEditingController phoneController;
  final String? Function(String?)? validator;

  const InputPhoneTextfield({super.key,required this.phoneController,required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      decoration: InputDecoration(
        labelText: "Telefon",
        hintText: "5xx xxx xx xx",
        labelStyle: TextStyle(
          color: Colors.grey,
          fontFamily: "Inter"
        ),
        prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 8),child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/icons/tr_flag.svg",width: 26,height: 26),
            SizedBox(width: 8),
            const Text("+90"),
            SizedBox(width: 8),
            Container(
              width: 0.5,
              height: 42,
              color: Colors.grey,
            ),
            SizedBox(width: 8),
          ],
        )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,width: 1),
          borderRadius: BorderRadius.circular(12)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black,width: 1),
          borderRadius: BorderRadius.circular(12)
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red,width: 1),
          borderRadius: BorderRadius.circular(12)
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red,width: 1),
          borderRadius: BorderRadius.circular(12)
        )
      ),
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      validator: validator,
      keyboardType: TextInputType.phone,
    );
  }
}