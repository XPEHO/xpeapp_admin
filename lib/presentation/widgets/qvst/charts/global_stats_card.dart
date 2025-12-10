import 'package:xpeapp_admin/data/utils/qvst_chart_utils.dart';
import 'package:xpeapp_admin/data/utils/qvst_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class GlobalStatsCard extends StatelessWidget {
  final GlobalStatsEntity? globalStats;

  const GlobalStatsCard({
    super.key,
    this.globalStats,
  });

  @override
  Widget build(BuildContext context) {
    final statsKey = GlobalKey();

    return CollapsibleCard(
      title: 'Statistiques globales',
      leadingIcon: Icons.analytics,
      color: Colors.white,
      trailingActions: [
        if (globalStats != null)
          ScreenshotButton(
            widgetKey: statsKey,
            title: 'Statistiques_globales',
          ),
      ],
      child: globalStats == null
          ? _buildEmptyState(context)
          : _buildStats(context, statsKey),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          'Aucune statistique disponible',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildStats(BuildContext context, GlobalKey statsKey) {
    final stats = globalStats!;
    final showAlert = stats.requiresAction ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepaintBoundary(
          key: statsKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  icon: Icons.people,
                  label: 'Répondants',
                  value: stats.totalRespondents?.toString() ?? '-',
                  color: Colors.blue,
                ),
                _buildStatItem(
                  context,
                  icon: Icons.question_answer,
                  label: 'Questions',
                  value: stats.totalQuestions?.toString() ?? '-',
                  color: Colors.purple,
                ),
                _buildStatItem(
                  context,
                  icon: Icons.percent,
                  label: 'Satisfaction moyenne',
                  value: stats.averageSatisfaction != null
                      ? QvstFormatters.formatPercentage(
                          stats.averageSatisfaction!)
                      : '-',
                  color: showAlert ? Colors.red : Colors.green,
                ),
                _buildStatItem(
                  context,
                  icon: Icons.warning,
                  label: 'Collaborateurs à risque',
                  value: stats.atRiskCount?.toString() ?? '-',
                  color:
                      (stats.atRiskCount ?? 0) > 0 ? Colors.red : Colors.green,
                ),
              ],
            ),
          ),
        ),
        if (showAlert)
          const QvstAlertBox(
            text:
                '⚠️ Attention : La satisfaction moyenne est inférieure à ${QvstConstants.satisfactionThreshold}%. Des actions sont nécessaires.',
          ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
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
        Text(label,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
