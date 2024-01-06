import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String?)? validator;
  final Function(DateTime?)? onDateSelected;

  DateInputField({
    required this.controller,
    required this.hintText,
    this.validator,
    this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200,
        ),
        controller: controller,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: ' $hintText',
          hintStyle: const TextStyle(color: Colors.grey),
          errorStyle: const TextStyle(color: Colors.red),
        ),
        validator: (val) {
          validator;
          return null;
        },
        onTap: () async {
          DateTime? date = DateTime(2023);
          FocusScope.of(context).requestFocus(FocusNode());
          date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2100),
          );
          if (date != null) {
            final formattedDate = DateFormat('EEEE d y', 'es_ES').format(date);
            controller.text =
                formattedDate; // Actualiza el valor del controlador
            if (onDateSelected != null) {
              onDateSelected!(date);
            }
          }
        },
      ),
    );
  }
}
