import 'package:xpeapp_admin/data/utils/qvst_stats_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstStatsTableView extends ConsumerStatefulWidget {
  final QvstStatsEntity stats;
  const QvstStatsTableView({
    super.key,
    required this.stats,
  });

  @override
  ConsumerState<QvstStatsTableView> createState() => _QvstStatsTableViewState();
}

class _QvstStatsTableViewState extends ConsumerState<QvstStatsTableView> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 10,
      columns: const [
        DataColumn(
          label: SizedBox(
            width: 120,
            child: Text(
              'Question inversée',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 300,
            child: Text(
              'Question',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 120,
            child: Text(
              '% satisfaction',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 200,
            child: Text(
              'Réponse la plus fréquente',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
      rows: widget.stats.questions.map(
        (QvstQuestionEntity question) {
          final questionKey = question.question;
          final reversedQuestions = ref.watch(reversedQuestionsProvider);
          final isReversed = reversedQuestions[questionKey] ?? false;

          return DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    Checkbox(
                      value: isReversed,
                      onChanged: (bool? value) {
                        final currentMap = ref.read(reversedQuestionsProvider);
                        ref.read(reversedQuestionsProvider.notifier).state = {
                          ...currentMap,
                          questionKey: value ?? false,
                        };
                      },
                    ),
                    if (isReversed)
                      const Icon(
                        Icons.swap_horiz,
                        color: Colors.orange,
                        size: 20,
                      ),
                  ],
                ),
              ),
              DataCell(
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
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
                  _getPercentOfQuestion(question, isReversed),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: isReversed ? Colors.orange : Colors.black,
                  ),
                ),
              ),
              DataCell(
                Text(
                  _getAnswerMoreFrequent(question, isReversed),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }

  String _getAnswerMoreFrequent(QvstQuestionEntity question,
      [bool isReversed = false]) {
    return QvstStatsUtils.getAnswerMoreFrequent(question.answers,
        isReversed: isReversed);
  }

  String _getPercentOfQuestion(QvstQuestionEntity question,
      [bool isReversed = false]) {
    return QvstStatsUtils.getPercentOfQuestion(question.answers,
        isReversed: isReversed, minValue: 1, maxValue: 5);
  }
}
