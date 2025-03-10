import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/action_button.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/custom_container.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/custom_list_tile.dart';
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
    return CustomContainer(
      child: Column(
        children: [
          CustomListTile(
            title:
                'Anniversaire de ${widget.birthdayEntity.first_name} le ${widget.birthdayEntity.birthdate}',
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
                  ActionButtons(
                    onEdit: widget.onEdit,
                    onDelete: () async {
                      await ref.read(
                          agendaBirthdayDeleteProvider(widget.birthdayEntity.id)
                              .future);
                      ref.invalidate(agendaBirthdayProvider);
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
