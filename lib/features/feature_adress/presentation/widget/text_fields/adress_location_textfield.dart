import 'package:flutter/material.dart';

class AdressLocationTextfield extends StatelessWidget {
  final String title;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final bool readOnly;
  final Color? color;
  final TextEditingController controller;
  final VoidCallback? onTap;

  const AdressLocationTextfield({
    super.key,
    required this.title,
    required this.hintText,
    required this.suffixIcon,
    required this.prefixIcon,
    required this.readOnly,
    required this.color,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: "Inter",
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            fillColor: color,
            focusColor: color,
            filled: true,
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red.shade500, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red.shade600, width: 1),
            )
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "bu alan boş bırakılamaz.";
            }
            return null;
          },
        ),
      ],
    );
  }
}
