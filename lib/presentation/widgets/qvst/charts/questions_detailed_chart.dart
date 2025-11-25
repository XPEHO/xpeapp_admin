import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class QuestionsDetailedChart extends StatelessWidget {
  final List<QuestionAnalysisEntity> questionsAnalysis;

  const QuestionsDetailedChart({
    super.key,
    required this.questionsAnalysis,
  });

  List<_ChartData> _prepareData() {
    return questionsAnalysis.asMap().entries.map((entry) {
      final question = entry.value;
      final answers = <int, int>{};
      final labels = <int, String>{};

      for (var answer in question.answers) {
        if (answer.score != null && answer.count != null) {
          answers[answer.score!] = answer.count!;
        }
        if (answer.score != null && answer.answerText.isNotEmpty) {
          labels[answer.score!] = answer.answerText;
        }
      }

      return _ChartData(
        label: 'Q${entry.key + 1}',
        questionText: question.questionText,
        scores: List.generate(5, (i) => answers[i + 1] ?? 0),
        answerLabels: labels,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final chartKey = GlobalKey();

    if (questionsAnalysis.isEmpty) {
      return CollapsibleCard(
        title: 'Distribution détaillée des réponses',
        leadingIcon: Icons.bar_chart,
        color: Colors.white,
        child: const Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 48),
            SizedBox(height: 8),
            Text('Aucune question ne nécessite d\'action !'),
          ],
        ),
      );
    }

    final data = _prepareData();
    final colors = [
      Colors.red.shade700,
      Colors.orange.shade700,
      Colors.grey.shade500,
      Colors.lightGreen.shade600,
      Colors.green.shade700,
    ];

    return CollapsibleCard(
      title: 'Distribution détaillée des réponses',
      leadingIcon: Icons.bar_chart,
      color: Colors.white,
      trailingActions: [
        ScreenshotButton(
          widgetKey: chartKey,
          title: 'Distribution_detaillee_reponses',
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Répartition des réponses par question problématique',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          const SizedBox(height: 16),
          RepaintBoundary(
            key: chartKey,
            child: SizedBox(
              height: 400,
              child: SfCartesianChart(
                primaryXAxis:
                    const CategoryAxis(labelStyle: TextStyle(fontSize: 10)),
                primaryYAxis: const NumericAxis(
                  title: AxisTitle(text: 'Pourcentage (%)'),
                  minimum: 0,
                  maximum: 100,
                ),
                legend: const Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                series: List.generate(5, (i) {
                  final noteLabels = data.isNotEmpty
                      ? data.first.answerLabels
                      : <int, String>{};
                  final label = noteLabels[i + 1] ?? 'Note ${i + 1}';

                  return StackedColumn100Series<_ChartData, String>(
                    name: label,
                    dataSource: data,
                    xValueMapper: (d, _) => d.label,
                    yValueMapper: (d, _) => d.scores[i],
                    color: colors[i],
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      textStyle:
                          const TextStyle(fontSize: 9, color: Colors.white),
                      builder:
                          (chartData, point, series, pointIndex, seriesIndex) {
                        final d = chartData as _ChartData;
                        final value = d.scores[i];
                        if (value == 0) return const SizedBox.shrink();

                        final total = d.scores.reduce((a, b) => a + b);
                        final percentage = (value / total * 100).round();
                        return Text('$percentage%',
                            style: const TextStyle(
                                fontSize: 9, color: Colors.white));
                      },
                    ),
                  );
                }),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  builder: (chartData, point, series, pointIndex, seriesIndex) {
                    final d = data[pointIndex];
                    final noteLabels = d.answerLabels;
                    final label = noteLabels[seriesIndex + 1] ??
                        'Note ${seriesIndex + 1}';
                    final count = d.scores[seriesIndex];
                    final total = d.scores.reduce((a, b) => a + b);
                    final percentage = (count / total * 100);

                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(d.questionText,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(
                              '$label: $count réponse${count > 1 ? 's' : ''} (${percentage.toStringAsFixed(1)}%)',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 11)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Plus il y a de rouge/orange, plus la question pose problème.',
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String label;
  final String questionText;
  final List<int> scores;
  final Map<int, String> answerLabels;

  _ChartData({
    required this.label,
    required this.questionText,
    required this.scores,
    required this.answerLabels,
  });
}
