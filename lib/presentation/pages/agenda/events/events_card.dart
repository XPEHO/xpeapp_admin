import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card_controls.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_summary_tile.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/datetime_picker_methods.dart';
import 'package:xpeapp_admin/providers.dart';

class EventsCard extends ConsumerStatefulWidget {
  final EventsEntity events;
  final VoidCallback onEdit;
  final String eventTypeLabel;

  const EventsCard({
    super.key,
    required this.events,
    required this.onEdit,
    required this.eventTypeLabel,
  });

  @override
  EventsCardState createState() => EventsCardState();
}

class EventsCardState extends ConsumerState<EventsCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final date = widget.events.date;
    // Format the DateTime to the desired format
    final formattedDate = DateFormat('dd/MM/yyyy').format(date);

    // Format the start and end time to only have the time
    final formattedStartTime = widget.events.startTime != null
        ? getTimeStringFromTimeOfDay(widget.events.startTime!)
        : null;
    final formattedEndTime = widget.events.endTime != null
        ? getTimeStringFromTimeOfDay(widget.events.endTime!)
        : null;

    return AgendaCard(
      child: Column(
        children: [
          AgendaSummaryTile(
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
                  if (formattedStartTime != null)
                    Text(
                      'Heure de début: $formattedStartTime',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  if (formattedEndTime != null)
                    Text(
                      'Heure de fin: $formattedEndTime',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  Text(
                    'Type d\'événement: ${widget.eventTypeLabel}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AgendaCardControls(
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
