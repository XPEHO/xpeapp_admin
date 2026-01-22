import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/utils/qvst_stats_utils.dart';

class QvstStatsTableView extends ConsumerStatefulWidget {
  final QvstStatsEntity stats;
  final String campaignId;
  const QvstStatsTableView({
    super.key,
    required this.stats,
    required this.campaignId,
  });

  @override
  ConsumerState<QvstStatsTableView> createState() => _QvstStatsTableViewState();
}

class _QvstStatsTableViewState extends ConsumerState<QvstStatsTableView> {
  final Set<String> _loadingReversed = {};
  final Set<String> _loadingNoLongerUsed = {};

  Future<void> _updateReversedQuestion(
    QvstQuestionEntity question,
    bool newValue,
  ) async {
    final questionId = question.id;
    if (questionId == null) return;

    setState(() => _loadingReversed.add(questionId));
    try {
      final qvstService = ref.read(qvstServiceProvider);
      await qvstService.updateQvstQuestion(
        questionId: questionId,
        reversedQuestion: newValue,
      );
      // Rafraîchir les stats
      ref.invalidate(qvstCampaignStatsProvider(widget.campaignId));
      // Invalider les questions par thème pour rafraîchir la création de campagne
      ref.invalidate(qvstQuestionsByThemesListProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              newValue
                  ? 'Question marquée comme inversée'
                  : 'Question non inversée',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _loadingReversed.remove(questionId));
      }
    }
  }

  Future<void> _updateNoLongerUsed(
    QvstQuestionEntity question,
    bool newValue,
  ) async {
    final questionId = question.id;
    if (questionId == null) return;

    setState(() => _loadingNoLongerUsed.add(questionId));
    try {
      final qvstService = ref.read(qvstServiceProvider);
      await qvstService.updateQvstQuestion(
        questionId: questionId,
        noLongerUsed: newValue,
      );
      // Rafraîchir les stats
      ref.invalidate(qvstCampaignStatsProvider(widget.campaignId));
      // Invalider les questions par thème pour rafraîchir la création de campagne
      ref.invalidate(qvstQuestionsByThemesListProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              newValue
                  ? 'Question désactivée pour les futures campagnes'
                  : 'Question réactivée pour les futures campagnes',
            ),
            backgroundColor: newValue ? Colors.orange : Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _loadingNoLongerUsed.remove(questionId));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      horizontalMargin: 10,
      columnSpacing: 20,
      columns: const [
        DataColumn(
          label: SizedBox(
            width: 70,
            child: Text(
              'Inversée',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 70,
            child: Text(
              'Obsolète',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 350,
            child: Text(
              'Question',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 80,
            child: Text(
              '% satisf.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        DataColumn(
          label: SizedBox(
            width: 150,
            child: Text(
              'Réponse fréquente',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
      rows: widget.stats.questions.map(
        (QvstQuestionEntity question) {
          final isReversed = question.reversedQuestionBool;
          final isNoLongerUsed = question.noLongerUsedBool;
          final questionId = question.id ?? '';
          final isLoadingReversed = _loadingReversed.contains(questionId);
          final isLoadingNoLongerUsed =
              _loadingNoLongerUsed.contains(questionId);

          return DataRow(
            cells: [
              DataCell(
                Row(
                  children: [
                    if (isLoadingReversed)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    else
                      Checkbox(
                        value: isReversed,
                        onChanged: (bool? value) {
                          _updateReversedQuestion(question, value ?? false);
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
                Row(
                  children: [
                    if (isLoadingNoLongerUsed)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    else
                      Checkbox(
                        value: isNoLongerUsed,
                        onChanged: (bool? value) {
                          _updateNoLongerUsed(question, value ?? false);
                        },
                      ),
                    if (isNoLongerUsed)
                      const Icon(
                        Icons.block,
                        color: Colors.red,
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      decoration:
                          isNoLongerUsed ? TextDecoration.lineThrough : null,
                      color: isNoLongerUsed ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
              ),
              DataCell(
                Text(
                  QvstStatsUtils.getPercentOfQuestion(question.answers,
                      isReversed: isReversed),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: isReversed ? Colors.orange : Colors.black,
                  ),
                ),
              ),
              DataCell(
                Text(
                  QvstStatsUtils.getAnswerMoreFrequent(question.answers),
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
}
