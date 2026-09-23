import 'package:flutter/material.dart';

class UserInfoTextfield extends StatelessWidget {
  final String title;
  final String labelText;
  final TextEditingController controller;

  const UserInfoTextfield({
    super.key,
    required this.title,
    required this.labelText,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
          fontFamily: "Inter",
          color: Colors.black,
          fontWeight: FontWeight.w600
        )),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: labelText,
            prefixIcon: Icon(Icons.person_outline),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade500,width: 1
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade700,width: 1
              )
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
            if(value == null || value.isEmpty) {
              return "bu alan boş olamaz";
            }
            return null;
          },
        ),
      ],
    );
  }
}
