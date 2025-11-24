import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';

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
    if (questionsAnalysis.isEmpty) {
      return CollapsibleCard(
        title: title,
        leadingIcon: Icons.help_outline,
        child: Column(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 48),
            const SizedBox(height: 8),
            const Text('Aucune question ne nécessite d\'action !'),
          ],
        ),
      );
    }

    return CollapsibleCard(
      title: title,
      leadingIcon: Icons.help_outline,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 400,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: const TextStyle(fontSize: 10),
                maximumLabels: 10,
                labelIntersectAction: AxisLabelIntersectAction.multipleRows,
              ),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Satisfaction (%)'),
                minimum: 0,
                maximum: 100,
              ),
              series: <CartesianSeries>[
                BarSeries<QuestionAnalysisEntity, String>(
                  name: '',
                  dataSource: questionsAnalysis,
                  xValueMapper: (QuestionAnalysisEntity data, _) =>
                      'Q${questionsAnalysis.indexOf(data) + 1}',
                  yValueMapper: (QuestionAnalysisEntity data, _) =>
                      data.satisfactionPercentage,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(fontSize: 10),
                  ),
                  color: Colors.red.shade400,
                ),
              ],
              tooltipBehavior: TooltipBehavior(
                enable: true,
                format: 'point.y%',
                builder: (data, point, series, pointIndex, seriesIndex) {
                  final question = questionsAnalysis[pointIndex];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      '${question.questionText}\n${question.satisfactionPercentage?.toStringAsFixed(1) ?? '-'}%',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildQuestionsList(),
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
                    'Questions ayant un taux de satisfaction inférieur à 75%. '
                    'Survolez les barres pour voir le texte complet de chaque question.',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsList() {
    return ExpansionTile(
      title: const Text('Détails des questions'),
      children: questionsAnalysis.map((question) {
        return ListTile(
          leading: Icon(
            Icons.warning,
            color: Colors.red.shade400,
          ),
          title: Text(question.questionText),
          subtitle: Text(
            '${question.themeName} - ${question.satisfactionPercentage?.toStringAsFixed(1) ?? '-'}%',
          ),
        );
      }).toList(),
    );
  }
}
