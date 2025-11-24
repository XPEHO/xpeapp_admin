import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';

class AtRiskEmployeesWidget extends StatelessWidget {
  final List<AtRiskEmployeeEntity>? atRiskEmployees;

  const AtRiskEmployeesWidget({
    super.key,
    this.atRiskEmployees,
  });

  @override
  Widget build(BuildContext context) {
    if (atRiskEmployees == null || atRiskEmployees!.isEmpty) {
      return CollapsibleCard(
        title: 'Collaborateurs à risque',
        leadingIcon: Icons.person_search,
        child: Column(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 48),
            const SizedBox(height: 8),
            const Text('Aucun collaborateur identifié à risque !'),
          ],
        ),
      );
    }

    return CollapsibleCard(
      title: 'Collaborateurs à risque (${atRiskEmployees?.length ?? 0})',
      leadingIcon: Icons.warning,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Plus le score de risque est élevé et plus la satisfaction est basse, plus le collaborateur est considéré à risque.',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: atRiskEmployees?.length ?? 0,
            itemBuilder: (context, index) {
              final employee = atRiskEmployees![index];
              return _buildEmployeeCard(context, employee, index + 1);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeCard(
    BuildContext context,
    AtRiskEmployeeEntity employee,
    int index,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.red.shade50,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getRiskColor(employee.riskScore ?? 0),
          child: Text(
            '#$index',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          'Collaborateur ${employee.anonymousUserId.substring(0, 12)}...',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Score de risque: ${employee.riskScore?.toStringAsFixed(1) ?? '-'} /10 - '
          'Satisfaction: ${employee.satisfactionPercentage?.toStringAsFixed(1) ?? '-'}%',
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                  Icons.trending_down,
                  'Réponses faibles',
                  '${employee.lowScoresCount ?? '-'} / ${employee.totalResponses ?? '-'}',
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  Icons.category,
                  'Thèmes critiques',
                  (employee.criticalThemes.isNotEmpty
                      ? employee.criticalThemes.join(', ')
                      : '-'),
                ),
                if (employee.openAnswer != null &&
                    employee.openAnswer!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text(
                    'Commentaire:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    employee.openAnswer!,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }

  Color _getRiskColor(double riskScore) {
    if (riskScore >= 7) return Colors.red.shade900;
    if (riskScore >= 5) return Colors.red.shade700;
    if (riskScore >= 3) return Colors.orange.shade700;
    return Colors.yellow.shade700;
  }
}
