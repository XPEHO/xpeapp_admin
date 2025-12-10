import 'package:xpeapp_admin/data/utils/qvst_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/data/utils/qvst_chart_utils.dart';
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
      final score = answer.score != null ? int.tryParse(answer.score!) : null;
      final count = answer.count;
      if (score != null) {
        if (count != null) answers[score] = count;
        if (answer.answerText.isNotEmpty) {
          labels[score] = answer.answerText;
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
    // Extraire les labels de la première question (toutes les questions ont les mêmes réponses possibles)
    final Map<int, String>? globalLabels =
        data.isNotEmpty ? data.first.answerLabels : null;

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
          series: _buildChartSeries(data, globalLabels),
          tooltipBehavior: _buildTooltipBehavior(data, globalLabels),
        ),
      ),
    );
  }

  List<StackedColumn100Series<ChartData, String>> _buildChartSeries(
      List<ChartData> data, Map<int, String>? labels) {
    return List.generate(5, (i) {
      final score = i + 1;
      final label = QvstChartUtils.getLabelForScore(score, labels: labels);
      final color = QvstChartUtils.getColorForScore(score);
      return StackedColumn100Series<ChartData, String>(
        name: label,
        dataSource: data,
        xValueMapper: (chartData, _) => chartData.label,
        yValueMapper: (chartData, _) => chartData.scores[i],
        color: color,
        dataLabelSettings: _buildDataLabelSettings(i),
      );
    });
  }

  DataLabelSettings _buildDataLabelSettings(int seriesIndex) {
    return DataLabelSettings(
      isVisible: true,
      textStyle: const TextStyle(fontSize: 9, color: Colors.white),
      builder: (chartData, point, series, pointIndex, _) {
        final chartDataObj = chartData as ChartData;
        final value = chartDataObj.scores[seriesIndex];
        if (value == 0) return const SizedBox.shrink();

        final total = chartDataObj.scores.reduce((acc, b) => acc + b);
        final percentage = (value / total * 100).round();
        return Text('$percentage%',
            style: const TextStyle(fontSize: 9, color: Colors.white));
      },
    );
  }

  TooltipBehavior _buildTooltipBehavior(
      List<ChartData> data, Map<int, String>? labels) {
    return TooltipBehavior(
      enable: true,
      builder: (chartData, point, series, pointIndex, seriesIndex) {
        final chartDataObj = data[pointIndex];
        final label =
            QvstChartUtils.getLabelForScore(seriesIndex + 1, labels: labels);
        final count = chartDataObj.scores[seriesIndex];
        final total = chartDataObj.scores.reduce((acc, b) => acc + b);
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
              Text(chartDataObj.questionText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(
                  '$label: $count réponse${count > 1 ? 's' : ''} (${QvstFormatters.formatPercentage(percentage)})',
                  style: const TextStyle(color: Colors.white, fontSize: 11)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoBanner() {
    return const QvstInfoBanner(
      text: 'Plus il y a de rouge/orange, plus la question pose problème.',
    );
  }
}
