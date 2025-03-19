// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card_controls.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_handle_error_in_operation.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_summary_tile.dart';
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
    return AgendaCard(
      child: Column(
        children: [
          AgendaSummaryTile(
            title: widget.eventsType.label,
            leadingIcon: Icons.event_note,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: AgendaCardControls(
              onEdit: widget.onEdit,
              onDelete: () async {
                // hande operation if create or update
                handleErrorInOperation(
                  operation: () async {
                    await ref.read(
                        agendaEventsTypeDeleteProvider(widget.eventsType.id)
                            .future);
                  },
                  ref: ref,
                  context: context,
                  onSuccess: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Type supprimé avec succès'),
                      ),
                    );
                  },
                  providersToInvalidate: [
                    agendaEventsTypeProvider,
                    agendaEventsTypeDeleteProvider,
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
