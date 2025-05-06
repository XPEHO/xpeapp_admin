import 'package:flutter/material.dart';

class AgendaFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool readOnly;
  final VoidCallback? onTap;
  final int maxLines;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const AgendaFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 500,
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        validator: validator,
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
