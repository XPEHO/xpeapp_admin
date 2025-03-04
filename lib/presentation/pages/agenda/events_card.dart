import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';

class EventsCard extends StatefulWidget {
  final EventsEntity events;

  const EventsCard({
    super.key,
    required this.events,
  });

  @override
  EventsCardState createState() => EventsCardState();
}

class EventsCardState extends State<EventsCard> {
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
                  '${widget.events.titre} le $formattedDate',
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
                      if (widget.events.lieu != null)
                        Text(
                          'Lieu: ${widget.events.lieu}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      if (widget.events.heure_debut != null)
                        Text(
                          'Heure de début: ${widget.events.heure_debut}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      if (widget.events.heure_fin != null)
                        Text(
                          'Heure de fin: ${widget.events.heure_fin}',
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
                            onPressed: () {
                              // Logique pour modifier l'événement
                            },
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            label: const Text(
                              'Modifier',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              // Logique pour supprimer l'événement
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
