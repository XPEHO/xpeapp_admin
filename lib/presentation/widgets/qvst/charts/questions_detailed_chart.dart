import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

typedef ChartData = ({
  String label,
  String questionText,
  List<int> scores,
  Map<int, String> answerLabels
});

class QuestionsDetailedChart extends StatelessWidget {
  final List<QuestionAnalysisEntity> questionsAnalysis;

  static const Map<int, String> _globalAnswerLabels = {
    1: 'Très faible / Jamais / Pas du tout',
    2: 'Faible / Rarement / Plutôt non',
    3: 'Moyen / Occasionnellement / Cela dépend',
    4: 'Bien / Assez souvent / Plutôt oui',
    5: 'Excellent / Très souvent / Tout à fait',
  };

  static const List<Color> _chartColors = [
    Color(0xFFD32F2F),
    Color(0xFFE65100),
    Color(0xFF616161),
    Color(0xFF689F38),
    Color(0xFF388E3C),
  ];

  static const double _chartHeight = 400.0;
  static const double _tooltipMaxWidth = 300.0;

  const QuestionsDetailedChart({
    super.key,
    required this.questionsAnalysis,
  });

  List<ChartData> _prepareData() {
    return questionsAnalysis
        .asMap()
        .entries
        .map((entry) => _mapQuestionToChartData(entry.key, entry.value))
        .toList();
  }

  ChartData _mapQuestionToChartData(
      int index, QuestionAnalysisEntity question) {
    final answers = <int, int>{};
    final labels = <int, String>{};

    for (var answer in question.answers) {
      if (answer.score != null) {
        if (answer.count != null) answers[answer.score!] = answer.count!;
        if (answer.answerText.isNotEmpty) {
          labels[answer.score!] = answer.answerText;
        }
      }
    }

    return (
      label: 'Q${index + 1}',
      questionText: question.questionText,
      scores: List.generate(5, (i) => answers[i + 1] ?? 0),
      answerLabels: labels,
    );
  }

  @override
  Widget build(BuildContext context) {
    final chartKey = GlobalKey();

    if (questionsAnalysis.isEmpty) {
      return _buildEmptyState();
    }

    final data = _prepareData();

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
          _buildChart(chartKey, data),
          const SizedBox(height: 16),
          _buildInfoBanner(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const CollapsibleCard(
      title: 'Distribution détaillée des réponses',
      leadingIcon: Icons.bar_chart,
      color: Colors.white,
      child: Column(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 48),
          SizedBox(height: 8),
          Text('Aucune question ne nécessite d\'action !'),
        ],
      ),
    );
  }

  Widget _buildChart(GlobalKey chartKey, List<ChartData> data) {
    return RepaintBoundary(
      key: chartKey,
      child: SizedBox(
        height: _chartHeight,
        child: SfCartesianChart(
          primaryXAxis: const CategoryAxis(labelStyle: TextStyle(fontSize: 10)),
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
          series: _buildChartSeries(data),
          tooltipBehavior: _buildTooltipBehavior(data),
        ),
      ),
    );
  }

  List<StackedColumn100Series<ChartData, String>> _buildChartSeries(
      List<ChartData> data) {
    return List.generate(5, (i) {
      final label = _globalAnswerLabels[i + 1] ?? 'Note ${i + 1}';

      return StackedColumn100Series<ChartData, String>(
        name: label,
        dataSource: data,
        xValueMapper: (d, _) => d.label,
        yValueMapper: (d, _) => d.scores[i],
        color: _chartColors[i],
        dataLabelSettings: _buildDataLabelSettings(i),
      );
    });
  }

  DataLabelSettings _buildDataLabelSettings(int seriesIndex) {
    return DataLabelSettings(
      isVisible: true,
      textStyle: const TextStyle(fontSize: 9, color: Colors.white),
      builder: (chartData, point, series, pointIndex, _) {
        final d = chartData as ChartData;
        final value = d.scores[seriesIndex];
        if (value == 0) return const SizedBox.shrink();

        final total = d.scores.reduce((a, b) => a + b);
        final percentage = (value / total * 100).round();
        return Text('$percentage%',
            style: const TextStyle(fontSize: 9, color: Colors.white));
      },
    );
  }

  TooltipBehavior _buildTooltipBehavior(List<ChartData> data) {
    return TooltipBehavior(
      enable: true,
      builder: (chartData, point, series, pointIndex, seriesIndex) {
        final d = data[pointIndex];
        final label =
            _globalAnswerLabels[seriesIndex + 1] ?? 'Note ${seriesIndex + 1}';
        final count = d.scores[seriesIndex];
        final total = d.scores.reduce((a, b) => a + b);
        final percentage = (count / total * 100);

        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(4),
          ),
          constraints: const BoxConstraints(maxWidth: _tooltipMaxWidth),
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
                  style: const TextStyle(color: Colors.white, fontSize: 11)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoBanner() {
    return Container(
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
    );
  }
}
