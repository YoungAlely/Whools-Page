import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whools/src/widgets/Widgets/hexcolor.dart';

class TimeInputField extends StatefulWidget {
  final TextEditingController controller;
  final Function(BuildContext) onTap;
  final String hintText;
  final String? errorText;

  const TimeInputField({
    required this.controller,
    required this.onTap,
    required this.hintText,
    this.errorText,
  });

  @override
  State<TimeInputField> createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {

  @override
  void initState() {
    widget.controller.text = DateFormat('HH:mm').format(DateTime.now());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
        style: const TextStyle(
          color: Colors.black
        ),
        controller: widget.controller,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: '  ${widget.hintText}',
          hintStyle: const TextStyle(color: Colors.grey),
          errorStyle: const TextStyle(color: Colors.red),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.errorText ?? 'Es necesario la hora';
          }
          return null;
        },
        onTap: () => widget.onTap(context),
        readOnly: true,
      ),
    );
  }
}