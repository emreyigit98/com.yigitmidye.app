import 'package:flutter/material.dart';

class NoteTextfield extends StatelessWidget {
  final TextEditingController controller;

  const NoteTextfield({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Adres Detayı",style: TextStyle(
          fontFamily: "Inter",
          color: Colors.black,
          fontWeight: FontWeight.w600
        )),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          maxLines: 2,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.note_outlined),
            hintText: "Apartman adı,bina no,daire no vb.",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
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