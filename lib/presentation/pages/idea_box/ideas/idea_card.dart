import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/idea_box/idea_entity.dart';
import 'package:xpeapp_admin/presentation/pages/idea_box/idea_utils.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_summary_tile.dart';

class IdeaCard extends ConsumerStatefulWidget {
  final IdeaEntity idea;
  final Function(String newStatus) onStatusChanged;

  const IdeaCard({
    super.key,
    required this.idea,
    required this.onStatusChanged,
  });

  @override
  IdeaCardState createState() => IdeaCardState();
}

class IdeaCardState extends ConsumerState<IdeaCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('dd/MM/yyyy').format(widget.idea.createdAt);

    return AgendaCard(
      child: Column(
        children: [
          AgendaSummaryTile(
            title:
                '${widget.idea.description.length > 50 ? "${widget.idea.description.substring(0, 50)}..." : widget.idea.description} - ${IdeaUtils.getStatusInFrench(widget.idea.status)}',
            leadingIcon: Icons.lightbulb,
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
                    'Contexte: ${widget.idea.context}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    'Date: $formattedDate',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildStatusActionButtons(),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusActionButtons() {
    final idea = widget.idea;
    final availableTransitions =
        IdeaUtils.getAvailableStatusTransitions(idea.status);

    if (availableTransitions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: availableTransitions.map((status) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _buildStatusButton(status),
        );
      }).toList(),
    );
  }

  Widget _buildStatusButton(String status) {
    switch (status) {
      case 'approved':
        return TextButton.icon(
          onPressed: () => widget.onStatusChanged('approved'),
          icon: const Icon(Icons.check_circle_outline, color: Colors.green),
          label: const Text(
            'Approuver',
            style: TextStyle(color: Colors.green),
          ),
        );
      case 'rejected':
        return TextButton.icon(
          onPressed: () => widget.onStatusChanged('rejected'),
          icon: const Icon(Icons.cancel_outlined, color: Colors.red),
          label: const Text(
            'Rejeter',
            style: TextStyle(color: Colors.red),
          ),
        );
      case 'implemented':
        return TextButton.icon(
          onPressed: () => widget.onStatusChanged('implemented'),
          icon: const Icon(Icons.task_alt, color: Colors.blue),
          label: const Text(
            'Implémenter',
            style: TextStyle(color: Colors.blue),
          ),
        );
      case 'pending':
        return TextButton.icon(
          onPressed: () => widget.onStatusChanged('pending'),
          icon: const Icon(Icons.restore, color: Colors.orange),
          label: const Text(
            'Remettre en attente',
            style: TextStyle(color: Colors.orange),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
