import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/providers.dart';

class EventsCard extends ConsumerStatefulWidget {
  final EventsEntity events;
  final VoidCallback onEdit;

  const EventsCard({
    super.key,
    required this.events,
    required this.onEdit,
  });

  @override
  EventsCardState createState() => EventsCardState();
}

class EventsCardState extends ConsumerState<EventsCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Convert the string date to DateTime
    final date = DateTime.parse(widget.events.date);
    // Format the DateTime to the desired format
    final formattedDate = DateFormat('dd/MM/yyyy').format(date);

    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
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
          borderRadius: BorderRadius.circular(50),
          child: Column(
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                tileColor: Colors.white,
                style: ListTileStyle.list,
                title: Text(
                  '${widget.events.title} le $formattedDate',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: const Icon(
                  Icons.event,
                ),
                trailing: Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ),
              if (_isExpanded)
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      if (widget.events.topic != null)
                        Text(
                          'Description: ${widget.events.topic}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      if (widget.events.location != null)
                        Text(
                          'Lieu: ${widget.events.location}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      if (widget.events.start_time != null)
                        Text(
                          'Heure de début: ${widget.events.start_time}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      if (widget.events.end_time != null)
                        Text(
                          'Heure de fin: ${widget.events.end_time}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      Text(
                        'Type d\'événement: ${widget.events.type.label}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
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
                                  agendaEventDeleteProvider(widget.events.id)
                                      .future);
                              ref.invalidate(agendaEventsProvider);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                            label: const Text(
                              'Supprimer',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
