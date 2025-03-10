import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/action_button.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/custom_container.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/custom_list_tile.dart';
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
    return CustomContainer(
      child: Column(
        children: [
          CustomListTile(
            title: widget.eventsType.label,
            leadingIcon: Icons.event_note,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: ActionButtons(
              onEdit: widget.onEdit,
              onDelete: () async {
                await ref.read(
                    agendaEventsTypeDeleteProvider(widget.eventsType.id)
                        .future);
                ref.invalidate(agendaEventsTypeProvider);
              },
            ),
          ),
        ],
      ),
    );
  }
}
