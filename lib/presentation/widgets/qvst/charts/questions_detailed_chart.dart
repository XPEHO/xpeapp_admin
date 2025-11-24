import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';

class QuestionsDetailedChart extends StatelessWidget {
  final List<QuestionAnalysisEntity> questionsAnalysis;

  const QuestionsDetailedChart({
    super.key,
    required this.questionsAnalysis,
  });

  List<_StackedData> _prepareStackedData() {
    return questionsAnalysis.asMap().entries.map((entry) {
      final index = entry.key;
      final question = entry.value;

      // Créer un map pour accéder facilement aux réponses par score
      final answersByScore = <int, int>{};
      final answerLabels = <int, String>{};
      for (var answer in question.answers) {
        if (answer.score != null && answer.count != null) {
          answersByScore[answer.score!] = answer.count!;
        }
        if (answer.score != null && answer.answerText.isNotEmpty) {
          answerLabels[answer.score!] = answer.answerText;
        }
      }

      return _StackedData(
        questionLabel: 'Question ${index + 1}',
        questionText: question.questionText,
        score1: answersByScore[1] ?? 0,
        score2: answersByScore[2] ?? 0,
        score3: answersByScore[3] ?? 0,
        score4: answersByScore[4] ?? 0,
        score5: answersByScore[5] ?? 0,
        answerLabels: answerLabels,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (questionsAnalysis.isEmpty) {
      return CollapsibleCard(
        title: 'Distribution détaillée des réponses',
        leadingIcon: Icons.bar_chart,
        child: Column(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 48),
            const SizedBox(height: 8),
            const Text('Aucune question ne nécessite d\'action !'),
          ],
        ),
      );
    }

    final stackedData = _prepareStackedData();

    // Générer dynamiquement les séries avec les labels du référentiel
    final noteLabels = <int, String>{};
    if (stackedData.isNotEmpty) {
      noteLabels.addAll(stackedData.first.answerLabels);
    }
    final seriesList = <StackedColumn100Series<_StackedData, String>>[];
    for (var score = 1; score <= 5; score++) {
      final label = noteLabels[score] ?? 'Note $score';
      final color = [
        Colors.red.shade700,
        Colors.orange.shade700,
        Colors.grey.shade500,
        Colors.lightGreen.shade600,
        Colors.green.shade700,
      ][score - 1];
      seriesList.add(
        StackedColumn100Series<_StackedData, String>(
          name: label,
          dataSource: stackedData,
          xValueMapper: (_StackedData data, _) => data.questionLabel,
          yValueMapper: (_StackedData data, _) => [
            data.score1,
            data.score2,
            data.score3,
            data.score4,
            data.score5
          ][score - 1],
          color: color,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: const TextStyle(fontSize: 9, color: Colors.white),
            builder: (data, point, series, pointIndex, seriesIndex) {
              final stackedData = data as _StackedData;
              final value = [
                stackedData.score1,
                stackedData.score2,
                stackedData.score3,
                stackedData.score4,
                stackedData.score5
              ][score - 1];
              if (value == 0) {
                return const SizedBox.shrink();
              }
              final total = stackedData.score1 +
                  stackedData.score2 +
                  stackedData.score3 +
                  stackedData.score4 +
                  stackedData.score5;
              final percentage = (value / total * 100);
              return Text(
                '${percentage.toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 9, color: Colors.white),
              );
            },
          ),
        ),
      );
    }
    return CollapsibleCard(
      title:
          'Distribution détaillée des réponses par questions qui pose problème dans la QVST',
      leadingIcon: Icons.bar_chart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comment les collaborateurs ont répondu à chaque question problématique',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 400,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: const TextStyle(fontSize: 10),
              ),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Pourcentage (%)'),
                minimum: 0,
                maximum: 100,
              ),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              series: seriesList,
              tooltipBehavior: TooltipBehavior(
                enable: true,
                builder: (data, point, series, pointIndex, seriesIndex) {
                  final questionData = stackedData[pointIndex];
                  final label =
                      noteLabels[seriesIndex + 1] ?? 'Note ${seriesIndex + 1}';
                  final counts = [
                    questionData.score1,
                    questionData.score2,
                    questionData.score3,
                    questionData.score4,
                    questionData.score5
                  ];
                  final count = counts[seriesIndex];
                  final total = questionData.score1 +
                      questionData.score2 +
                      questionData.score3 +
                      questionData.score4 +
                      questionData.score5;
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
                        Text(
                          questionData.questionText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$label: $count réponse${count > 1 ? 's' : ''} (${percentage.toStringAsFixed(1)}%)',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildLegendInfo(),
        ],
      ),
    );
  }

  Widget _buildLegendInfo() {
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
              'Ce graphique montre comment les réponses sont réparties pour chaque question. '
              'Plus il y a de rouge/orange, plus la question pose problème.',
              style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StackedData {
  final String questionLabel;
  final String questionText;
  final int score1;
  final int score2;
  final int score3;
  final int score4;
  final int score5;
  final Map<int, String> answerLabels;

  _StackedData({
    required this.questionLabel,
    required this.questionText,
    required this.score1,
    required this.score2,
    required this.score3,
    required this.score4,
    required this.score5,
    required this.answerLabels,
  });
}
