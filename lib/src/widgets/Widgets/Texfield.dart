import 'package:flutter/material.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';


Widget buildTextField({
  required TextEditingController controller,
  required String hintText,
  required String errorText,
  int maxLines = 1
}) {
  return Container(
    decoration: BoxDecoration(
      color: HexColor("e5e6e4"),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 3,
          offset: Offset(0, 2),
        ),
      ],
      borderRadius: BorderRadius.circular(30),
    ),
    child: TextFormField(
      style: TextStyle(
        color: Colors.black
      ),
      maxLines: maxLines,
      controller: controller,
       textInputAction: TextInputAction.none,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: '  $hintText',
        hintStyle: TextStyle(color: Colors.grey),
        errorStyle: TextStyle(color: Colors.red),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    ),
  );
}