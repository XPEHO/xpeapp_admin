import 'package:xpeapp_admin/data/utils/qvst_chart_utils.dart';
import 'package:xpeapp_admin/data/utils/qvst_ui_utils.dart';
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
                  pointColorMapper: (q, _) => (q.satisfactionPercentage ?? 0) <
                          QvstConstants.satisfactionThreshold
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
        const QvstInfoBanner(
          text: 'Plus il y a de rouge, plus la question pose problème.',
        ),
      ],
    );
  }

  Widget _tooltip(int index) {
    final q = questionsAnalysis[index];
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'Satisfaction : ${QvstFormatters.formatPercentage(q.satisfactionPercentage ?? 0)}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
