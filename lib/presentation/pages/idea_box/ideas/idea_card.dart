import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/entities/idea_box/idea_entity.dart';
import 'package:xpeapp_admin/presentation/pages/idea_box/idea_utils.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_summary_tile.dart';
import 'package:yaki_ui/button.dart';

class IdeaCard extends ConsumerStatefulWidget {
  final IdeaEntity idea;
  final Future<void> Function(String newStatus, String? reason) onStatusChanged;

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

  String? get _submittedByLabel {
    final author = widget.idea.author?.trim();
    return (author?.isNotEmpty ?? false) ? author : null;
  }

  String? get _reasonLabel {
    final reason = widget.idea.reason?.trim();
    return (reason?.isNotEmpty ?? false) ? reason : null;
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('dd/MM/yyyy').format(widget.idea.createdAt);
    final submittedByLabel = _submittedByLabel;
    final reasonLabel = _reasonLabel;

    return AgendaCard(
      child: Column(
        children: [
          AgendaSummaryTile(
            title:
                '${widget.idea.description} - ${IdeaUtils.getStatusInFrench(widget.idea.status)}',
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
                  if (reasonLabel != null)
                    Text(
                      'Message: $reasonLabel',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  if (submittedByLabel != null)
                    Text(
                      'Soumise par: $submittedByLabel',
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
          onPressed: () => _onStatusButtonPressed('approved'),
          icon: const Icon(Icons.check_circle_outline, color: Colors.green),
          label: const Text(
            'Approuver',
            style: TextStyle(color: Colors.green),
          ),
        );
      case 'rejected':
        return TextButton.icon(
          onPressed: () => _onStatusButtonPressed('rejected'),
          icon: const Icon(Icons.cancel_outlined, color: Colors.red),
          label: const Text(
            'Rejeter',
            style: TextStyle(color: Colors.red),
          ),
        );
      case 'implemented':
        return TextButton.icon(
          onPressed: () => _onStatusButtonPressed('implemented'),
          icon: const Icon(Icons.task_alt, color: Colors.blue),
          label: const Text(
            'Implémenter',
            style: TextStyle(color: Colors.blue),
          ),
        );
      case 'pending':
        return TextButton.icon(
          onPressed: () => _onStatusButtonPressed('pending'),
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

  Future<void> _onStatusButtonPressed(String status) async {
    final reason = await _showReasonDialog(status);

    if (reason == null) {
      return;
    }

    await widget.onStatusChanged(status, reason.isEmpty ? null : reason);
  }

  Future<String?> _showReasonDialog(String status) async {
    final controller = TextEditingController();
    final result = await showDialog<String?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(
              'Ajouter un mot (${IdeaUtils.getStatusInFrench(status).toLowerCase()})'),
          content: Container(
            width: 700,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 1.5),
            ),
            child: TextFormField(
              controller: controller,
              minLines: 2,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Ex: Merci pour l\'idée, on la planifie pour avril',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SF Pro Rounded',
                  color: Colors.black54,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF Pro Rounded',
              ),
            ),
          ),
          actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          actions: [
            SizedBox(
              width: 110,
              child: Button.secondary(
                text: 'Annuler',
                onPressed: () => Navigator.of(context).pop(null),
              ),
            ),
            SizedBox(
              width: 140,
              child: Button.secondary(
                text: 'Sans message',
                onPressed: () => Navigator.of(context).pop(''),
              ),
            ),
            SizedBox(
              width: 110,
              child: Button.secondary(
                text: 'Valider',
                onPressed: () =>
                    Navigator.of(context).pop(controller.text.trim()),
              ),
            ),
          ],
        );
      },
    );
    controller.dispose();
    return result;
  }
}
