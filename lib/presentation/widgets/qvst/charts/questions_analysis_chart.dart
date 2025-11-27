import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class QuestionsAnalysisChart extends StatelessWidget {
  final List<QuestionAnalysisEntity> questionsAnalysis;
  final String title;

  const QuestionsAnalysisChart({
    super.key,
    required this.questionsAnalysis,
    this.title = 'Questions nécessitant une action',
  });

  @override
  Widget build(BuildContext context) {
    final chartKey = GlobalKey();

    return CollapsibleCard(
      title: title,
      leadingIcon: Icons.help_outline,
      color: Colors.white,
      trailingActions: questionsAnalysis.isEmpty
          ? null
          : [
              ScreenshotButton(
                widgetKey: chartKey,
                title: 'Questions_necessitant_action',
              ),
            ],
      child: questionsAnalysis.isEmpty
          ? _buildEmpty()
          : _buildContent(context, chartKey),
    );
  }

  Widget _buildEmpty() => const Column(
        children: [
          Icon(Icons.info, color: Colors.blue, size: 48),
          SizedBox(height: 8),
          Text("Aucune question disponible"),
        ],
      );

  Widget _buildContent(BuildContext context, GlobalKey chartKey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RepaintBoundary(
          key: chartKey,
          child: SizedBox(
            height: 400,
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                labelStyle: TextStyle(fontSize: 10),
                labelIntersectAction: AxisLabelIntersectAction.multipleRows,
              ),
              primaryYAxis: const NumericAxis(minimum: 0, maximum: 100),
              series: [
                BarSeries<QuestionAnalysisEntity, String>(
                  dataSource: questionsAnalysis,
                  xValueMapper: (_, i) => 'Question ${i + 1}',
                  yValueMapper: (q, _) => q.satisfactionPercentage,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  // Couleur conditionnelle : rouge si < 75%, vert sinon
                  pointColorMapper: (q, _) =>
                      (q.satisfactionPercentage ?? 0) < 75
                          ? Colors.red.shade400
                          : Colors.green.shade400,
                ),
              ],
              tooltipBehavior: TooltipBehavior(
                enable: true,
                builder: (data, _, __, i, ___) => _tooltip(i),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _infoBox(),
      ],
    );
  }

  Widget _tooltip(int index) {
    final q = questionsAnalysis[index];
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(4),
      ),
      constraints: const BoxConstraints(maxWidth: 300),
      child: Text(
        '${q.questionText}\n${q.satisfactionPercentage?.toStringAsFixed(1) ?? '-'}%',
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _infoBox() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.shade200),
        ),
        child: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.blue.shade700),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Aperçu des questions avec leur taux de satisfaction. Les questions en rouge ont une satisfaction < 75%.',
                style: TextStyle(color: Colors.blue.shade900, fontSize: 12),
              ),
            ),
          ],
        ),
      );
}
