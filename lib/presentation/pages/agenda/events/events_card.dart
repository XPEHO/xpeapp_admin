import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/action_button.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/custom_container.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/custom_list_tile.dart';
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

    return CustomContainer(
      child: Column(
        children: [
          CustomListTile(
            title: '${widget.events.title} le $formattedDate',
            leadingIcon: Icons.event,
            trailingIcon:
                _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
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
                  ActionButtons(
                    onEdit: widget.onEdit,
                    onDelete: () async {
                      await ref.read(
                          agendaEventDeleteProvider(widget.events.id).future);
                      ref.invalidate(agendaEventsProvider);
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
