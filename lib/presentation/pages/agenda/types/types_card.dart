import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/providers.dart';

class TypeCard extends ConsumerStatefulWidget {
  final EventsTypeEntity eventsType;
  final VoidCallback onEdit;

  const TypeCard({
    super.key,
    required this.eventsType,
    required this.onEdit,
  });

  @override
  TypeCardState createState() => TypeCardState();
}

class TypeCardState extends ConsumerState<TypeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(70),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              tileColor: Colors.white,
              style: ListTileStyle.list,
              title: Text(
                widget.eventsType.label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.event_note,
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: widget.onEdit,
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    label: const Text(
                      'Modifier',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      await ref.read(
                          agendaEventsTypeDeleteProvider(widget.eventsType.id)
                              .future);
                      ref.invalidate(agendaEventsTypeProvider);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                    label: const Text(
                      'Supprimer',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
