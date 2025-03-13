import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

// DateTime format

DateTime getDateFromDateString(String date) {
  return DateFormat('yyyy-MM-dd').parse(date);
}

DateTime? getTimeFromTimeString(String time) {
  if (time.isEmpty) {
    return null;
  }
  return DateFormat('HH:mm:ss').parse(time);
}

String getTimeStringFromTime(DateTime time) {
  return DateFormat('HH:mm:ss').format(time);
}

// TimeOfDay format

TimeOfDay? getTimeOfDayFromTimeString(String time) {
  if (time.isEmpty) {
    return null;
  }
  final dt = getTimeFromTimeString(time);
  if (dt == null) {
    return null;
  }
  return TimeOfDay.fromDateTime(dt);
}

DateTime getTimeFromTimeOfDay(TimeOfDay time) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, time.hour, time.minute);
}

String getTimeStringFromTimeOfDay(TimeOfDay time) {
  final dt = getTimeFromTimeOfDay(time);
  return getTimeStringFromTime(dt);
}
