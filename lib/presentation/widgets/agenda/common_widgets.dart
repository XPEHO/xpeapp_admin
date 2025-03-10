import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';

Widget getText(String text, {double? size = 16, Color? color = Colors.white}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    ),
  );
}

Widget getTextField({
  required TextEditingController controller,
  required String hintText,
  bool readOnly = false,
  VoidCallback? onTap,
  int maxLines = 1,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    width: 500,
    child: TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget getDatePickerRow({
  required DateTime? selectedDate,
  required VoidCallback onDateSelected,
  required BuildContext context,
  required String labelText,
}) {
  final dateFormatted = DateFormat('dd/MM/yyyy');
  return Row(
    children: [
      getText(labelText, color: Colors.black),
      const SizedBox(width: 20),
      (selectedDate == null)
          ? IconButton(
              onPressed: onDateSelected,
              icon: Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 10),
                  getText('Aucune date', size: 16, color: Colors.black),
                ],
              ),
            )
          : TextButton(
              onPressed: onDateSelected,
              child: getText(
                dateFormatted.format(selectedDate),
                size: 16,
                color: Colors.black,
              ),
            ),
    ],
  );
}

Widget getElevatedButton({
  required bool isEnabled,
  required VoidCallback onPressed,
  required String buttonText,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 30, bottom: 30, left: 50),
    width: 200,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDefaultXpehoColor,
      ),
      onPressed: isEnabled ? onPressed : null,
      child: Text(buttonText),
    ),
  );
}
