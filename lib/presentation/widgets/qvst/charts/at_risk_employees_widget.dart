import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/data/utils/qvst_chart_utils.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class AtRiskEmployeesWidget extends StatelessWidget {
  final List<AtRiskEmployeeEntity>? atRiskEmployees;

  const AtRiskEmployeesWidget({super.key, this.atRiskEmployees});

  @override
  Widget build(BuildContext context) {
    final employees = atRiskEmployees ?? [];
    final listKey = GlobalKey();

    if (employees.isEmpty) {
      return const CollapsibleCard(
        title: 'Collaborateurs à risque',
        leadingIcon: Icons.person_search,
        color: Colors.white,
        child: Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 48),
            SizedBox(height: 8),
            Text('Aucun collaborateur identifié à risque !'),
          ],
        ),
      );
    }

    return CollapsibleCard(
      title: 'Collaborateurs à risque (${employees.length})',
      leadingIcon: Icons.warning,
      color: Colors.white,
      trailingActions: [
        ScreenshotButton(
          widgetKey: listKey,
          title: 'Collaborateurs_a_risque',
        ),
      ],
      child: RepaintBoundary(
        key: listKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Collaborateurs identifiés à risque basés sur leur taux de satisfaction faible.',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(height: 16),
            ...employees
                .asMap()
                .entries
                .map((entry) => _buildEmployeeCard(entry.value, entry.key + 1)),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeCard(AtRiskEmployeeEntity employee, int index) {
    final satisfaction = employee.satisfactionPercentage ?? 0;
    final userId = employee.anonymousUserId;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.red.shade50,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: QvstChartUtils.getSatisfactionColor(satisfaction),
          child: Text('#$index', style: const TextStyle(color: Colors.white)),
        ),
        title: Text(
          'Collaborateur ${userId.length > 12 ? userId.substring(0, 12) : userId}...',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Satisfaction: ${satisfaction.toStringAsFixed(1)}%'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoRow(Icons.people, 'Réponses totales',
                    '${employee.totalResponses ?? '-'}'),
                if (employee.openAnswer?.isNotEmpty == true) ...[
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text('Commentaire:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(employee.openAnswer!,
                      style: const TextStyle(fontStyle: FontStyle.italic)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(child: Text(value)),
      ],
    );
  }
}
