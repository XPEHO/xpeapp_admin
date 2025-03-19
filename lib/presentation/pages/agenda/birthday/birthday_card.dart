import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card_controls.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_handle_error_in_operation.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_summary_tile.dart';
import 'package:xpeapp_admin/providers.dart';

class BirthdayCard extends ConsumerStatefulWidget {
  final BirthdayEntity birthdayEntity;
  final VoidCallback onEdit;

  const BirthdayCard({
    super.key,
    required this.birthdayEntity,
    required this.onEdit,
  });

  @override
  BirthdayCardState createState() => BirthdayCardState();
}

class BirthdayCardState extends ConsumerState<BirthdayCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd/MM'); // Define the date format
    final String formattedBirthdayDate =
        dateFormat.format(widget.birthdayEntity.birthdate);

    return AgendaCard(
      child: Column(
        children: [
          AgendaSummaryTile(
            title:
                'Anniversaire de ${widget.birthdayEntity.firstName} le $formattedBirthdayDate',
            leadingIcon: Icons.event_note,
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
                  Text(
                    'Email: ${widget.birthdayEntity.email}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AgendaCardControls(
                    onEdit: widget.onEdit,
                    onDelete: () async {
                      // hande operation if create or update
                      handleErrorInOperation(
                        operation: () async {
                          await ref.read(agendaBirthdayDeleteProvider(
                                  widget.birthdayEntity.id)
                              .future);
                        },
                        ref: ref,
                        context: context,
                        onSuccess: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Anniversaire supprimé avec succès')),
                          );
                        },
                        providersToInvalidate: [
                          agendaBirthdayDeleteProvider,
                          agendaBirthdayProvider,
                        ],
                      );
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
