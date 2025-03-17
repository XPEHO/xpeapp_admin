import 'package:flutter/material.dart';

class AgendaCardControls extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const AgendaCardControls({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: onEdit,
          icon: const Icon(Icons.edit, color: Colors.blue),
          label: const Text(
            'Modifier',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        TextButton.icon(
          onPressed: onDelete,
          icon: const Icon(Icons.delete, color: Colors.red),
          label: const Text(
            'Supprimer',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
