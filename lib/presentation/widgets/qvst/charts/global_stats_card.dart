import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';

class GlobalStatsCard extends StatelessWidget {
  final GlobalStatsEntity? globalStats;

  const GlobalStatsCard({
    super.key,
    this.globalStats,
  });

  @override
  Widget build(BuildContext context) {
    if (globalStats == null) {
      return Card(
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              'Aucune statistique disponible',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      );
    }
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Statistiques globales',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  Icons.people,
                  'Répondants',
                  globalStats!.totalRespondents?.toString() ?? '-',
                  Colors.blue,
                ),
                _buildStatItem(
                  context,
                  Icons.question_answer,
                  'Questions',
                  globalStats?.totalQuestions?.toString() ?? '-',
                  Colors.purple,
                ),
                _buildStatItem(
                  context,
                  Icons.percent,
                  'Satisfaction moyenne',
                  globalStats?.averageSatisfaction != null
                      ? '${globalStats!.averageSatisfaction!.toStringAsFixed(1)}%'
                      : '-',
                  (globalStats?.requiresAction ?? false)
                      ? Colors.red
                      : Colors.green,
                ),
                _buildStatItem(
                  context,
                  Icons.warning,
                  'Collaborateurs à risque',
                  globalStats?.atRiskCount?.toString() ?? '-',
                  (globalStats?.atRiskCount ?? 0) > 0
                      ? Colors.red
                      : Colors.green,
                ),
              ],
            ),
            if (globalStats?.requiresAction ?? false) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade300),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.red.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '⚠️ Attention : La satisfaction moyenne est inférieure à 75%. '
                        'Des actions sont nécessaires.',
                        style: TextStyle(
                          color: Colors.red.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, size: 48, color: color),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
