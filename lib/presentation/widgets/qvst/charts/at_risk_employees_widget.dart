import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
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
              'Plus le score de risque est élevé et plus la satisfaction est basse, plus le collaborateur est considéré à risque.',
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
    final riskScore = employee.riskScore ?? 0;
    final satisfaction = employee.satisfactionPercentage ?? 0;
    final userId = employee.anonymousUserId;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.red.shade50,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getRiskColor(riskScore),
          child: Text('#$index', style: const TextStyle(color: Colors.white)),
        ),
        title: Text(
          'Collaborateur ${userId.length > 12 ? userId.substring(0, 12) : userId}...',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            'Score: ${riskScore.toStringAsFixed(1)}/10 - Satisfaction: ${satisfaction.toStringAsFixed(1)}%'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoRow(Icons.trending_down, 'Réponses faibles',
                    '${employee.lowScoresCount ?? '-'} / ${employee.totalResponses ?? '-'}'),
                const SizedBox(height: 8),
                _InfoRow(
                    Icons.category,
                    'Thèmes critiques',
                    employee.criticalThemes.isEmpty
                        ? '-'
                        : employee.criticalThemes.join(', ')),
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

  Color _getRiskColor(double score) {
    return switch (score) {
      >= 7 => Colors.red.shade900,
      >= 5 => Colors.red.shade700,
      >= 3 => Colors.orange.shade700,
      _ => Colors.yellow.shade700,
    };
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
