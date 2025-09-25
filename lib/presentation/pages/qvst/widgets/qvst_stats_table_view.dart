import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';

class QvstStatsTableView extends StatelessWidget {
  final QvstStatsEntity stats;
  const QvstStatsTableView({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text(
            'Question',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            '% satisfaction',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Réponse la plus fréquente',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
      rows: stats.questions
          .map(
            (QvstQuestionEntity question) => DataRow(
              cells: [
                DataCell(
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      question.question,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    _getPercentOfQuestion(question),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    _getAnswerMoreFrequent(question),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  double calculateWeightedAverage(List<QvstAnswerEntity> answers) {
    double totalValue = 0;
    int totalResponses = 0;

    for (var answer in answers) {
      totalValue += int.parse(answer.value) * answer.numberAnswered!;
      totalResponses += answer.numberAnswered!;
    }

    return totalResponses > 0 ? totalValue / totalResponses : 0;
  }

  double mapToPercentage(double value, double minValue, double maxValue) {
    return ((value - minValue) / (maxValue - minValue)) * 100;
  }

  String _getAnswerMoreFrequent(QvstQuestionEntity question) {
    QvstAnswerEntity? answerMoreFrequent = question.answers.fold(
      null,
      (previousValue, element) => previousValue == null ||
              element.numberAnswered! > previousValue.numberAnswered!
          ? element
          : previousValue,
    );

    return answerMoreFrequent?.answer ?? '';
  }

  String _getPercentOfQuestion(QvstQuestionEntity question) {
    double average = calculateWeightedAverage(question.answers);

    // Définir la plage de valeurs (dans cet exemple, 1 à 5)
    double minValue = 1;
    double maxValue = 5;

    // Convertir la moyenne pondérée en pourcentage
    double percentage = mapToPercentage(average, minValue, maxValue);

    // Arrondir le pourcentage à 2 décimales
    return (percentage.isNegative)
        ? '0 %'
        : "${percentage.toStringAsFixed(2)} %";
  }
}
