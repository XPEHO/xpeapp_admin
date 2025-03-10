import 'package:flutter/material.dart';

Future<void> showDatePickerForEvent({
  required BuildContext context,
  required DateTime? selectedDate,
  required ValueChanged<DateTime?> onDateSelected,
}) async {
  final DateTime? selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1945),
    lastDate: DateTime(2035),
    currentDate: selectedDate ?? DateTime.now(),
    helpText: 'Choisir la date de l\'événement',
  );

  onDateSelected(selected);
}

Future<void> showTimePickerForEvent({
  required BuildContext context,
  required bool isStartTime,
  required ValueChanged<TimeOfDay?> onTimeSelected,
}) async {
  final TimeOfDay? selected = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    helpText:
        isStartTime ? 'Choisir l\'heure de début' : 'Choisir l\'heure de fin',
  );

  onTimeSelected(selected);
}
