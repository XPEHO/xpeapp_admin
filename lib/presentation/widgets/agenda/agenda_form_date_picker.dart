import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_form_label.dart';

class AgendaFormDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onDateSelected;
  final String labelText;

  const AgendaFormDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat('dd/MM/yyyy');
    return Row(
      children: [
        AgendaFormLabel(text: labelText, color: Colors.black),
        const SizedBox(width: 20),
        (selectedDate == null)
            ? IconButton(
                onPressed: onDateSelected,
                icon: const Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 10),
                    AgendaFormLabel(text: 'Aucune date', color: Colors.black),
                  ],
                ),
              )
            : TextButton(
                onPressed: onDateSelected,
                child: AgendaFormLabel(
                  text: dateFormatted.format(selectedDate!),
                  size: 16,
                  color: Colors.black,
                ),
              ),
      ],
    );
  }
}
