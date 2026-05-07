import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/data/utils/qvst_chart_utils.dart';
import 'package:xpeapp_admin/data/utils/qvst_ui_utils.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';
import 'package:xpeapp_admin/providers.dart';

class QuestionsSelectionPieChart extends ConsumerStatefulWidget {
  final List<QuestionAnalysisEntity> questionsAnalysis;

  const QuestionsSelectionPieChart({
    super.key,
    required this.questionsAnalysis,
  });

  @override
  ConsumerState<QuestionsSelectionPieChart> createState() =>
      _QuestionsSelectionPieChartState();
}

class _QuestionsSelectionPieChartState
    extends ConsumerState<QuestionsSelectionPieChart> {
  static const int _maxScore = 5;
  final Set<String> _selectedQuestionIds = <String>{};

  @override
  void initState() {
    super.initState();
    if (widget.questionsAnalysis.isNotEmpty) {
      _selectedQuestionIds.add(widget.questionsAnalysis.first.questionId);
    }
  }

  @override
  void didUpdateWidget(covariant QuestionsSelectionPieChart oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.questionsAnalysis != widget.questionsAnalysis) {
      final availableIds =
          widget.questionsAnalysis.map((q) => q.questionId).toSet();
      _selectedQuestionIds.removeWhere((id) => !availableIds.contains(id));

      if (_selectedQuestionIds.isEmpty && widget.questionsAnalysis.isNotEmpty) {
        _selectedQuestionIds.add(widget.questionsAnalysis.first.questionId);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final reversedQuestions = ref.watch(reversedQuestionsProvider);
    final chartKey = GlobalKey();

    if (widget.questionsAnalysis.isEmpty) {
      return const CollapsibleCard(
        title: 'Questions et satisfaction',
        leadingIcon: Icons.help_outline,
        color: Colors.white,
        child: Column(
          children: [
            Icon(Icons.info, color: Colors.blue, size: 48),
            SizedBox(height: 8),
            Text('Aucune question disponible'),
          ],
        ),
      );
    }

    final selectedQuestions = widget.questionsAnalysis
        .where((q) => _selectedQuestionIds.contains(q.questionId))
        .toList();

    return CollapsibleCard(
      title: 'Questions et satisfaction',
      leadingIcon: Icons.help_outline,
      color: Colors.white,
      trailingActions: selectedQuestions.isEmpty
          ? null
          : [
              ScreenshotButton(
                widgetKey: chartKey,
                title: 'Questions_selection_camembert',
              ),
            ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sélectionnez une ou plusieurs questions pour voir leur distribution des réponses.',
            style: TextStyle(color: Colors.grey[700], fontSize: 13),
          ),
          const SizedBox(height: 12),
          _buildQuestionsSelector(),
          const SizedBox(height: 16),
          if (selectedQuestions.isEmpty)
            const QvstInfoBanner(
              text:
                  'Sélectionnez au moins une question pour afficher le camembert.',
            )
          else
            RepaintBoundary(
              key: chartKey,
              child: _buildPieChart(selectedQuestions, reversedQuestions),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionsSelector() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 280),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: widget.questionsAnalysis.length,
        separatorBuilder: (_, __) => Divider(
          color: Colors.grey.shade200,
          height: 1,
        ),
        itemBuilder: (context, index) {
          final question = widget.questionsAnalysis[index];
          final isSelected = _selectedQuestionIds.contains(question.questionId);

          return CheckboxListTile(
            value: isSelected,
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            activeColor: Theme.of(context).primaryColor,
            title: Text(
              'Question ${index + 1} - ${question.questionText}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              'Satisfaction: ${QvstFormatters.formatPercentage(question.satisfactionPercentage ?? 0)}',
            ),
            onChanged: (_) => _toggleQuestion(question.questionId),
          );
        },
      ),
    );
  }

  Widget _buildPieChart(List<QuestionAnalysisEntity> selectedQuestions,
      Map<String, bool> reversedQuestions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          selectedQuestions.length == 1
              ? '1 question sélectionnée'
              : '${selectedQuestions.length} questions sélectionnées',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),

        // Grid of pies: 2 columns
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
          physics: const NeverScrollableScrollPhysics(),
          children: selectedQuestions.map((question) {
            final isReversed = reversedQuestions[question.questionId] ?? false;
            final data = _buildChartDataForQuestion(question, isReversed);
            final totalResponses = data.fold<int>(0, (s, d) => s + d.count);

            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      question.questionText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: SfCircularChart(
                        legend: const Legend(
                          isVisible: false,
                        ),
                        series: <CircularSeries>[
                          PieSeries<_PieChartData, String>(
                            dataSource: data,
                            xValueMapper: (d, _) => d.label,
                            yValueMapper: (d, _) => d.count,
                            pointColorMapper: (d, _) => d.color,
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                              labelPosition: ChartDataLabelPosition.outside,
                              connectorLineSettings: ConnectorLineSettings(
                                type: ConnectorType.line,
                              ),
                            ),
                            enableTooltip: true,
                          ),
                        ],
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          builder: (raw, _, __, ___, ____) {
                            final d = raw as _PieChartData;
                            final pct = totalResponses == 0
                                ? 0.0
                                : (d.count / totalResponses) * 100;
                            return Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${d.label}\n${d.count} réponses\n${QvstFormatters.formatPercentage(pct)}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 4,
                      children: data.map((d) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: d.color,
                                shape: BoxShape.rectangle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${d.label} (${d.count})',
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 12),
        const QvstInfoBanner(
          text:
              'Galerie de camemberts par question. Les couleurs sont synchronisées par score.',
        ),
      ],
    );
  }

  List<_PieChartData> _buildChartDataForQuestion(
      QuestionAnalysisEntity question, bool isReversed) {
    final countsByScore = <int, int>{for (var i = 1; i <= _maxScore; i++) i: 0};
    final answerLabels = <int, String>{};

    for (final answer in question.answers) {
      final score = answer.score != null ? int.tryParse(answer.score!) : null;
      final count = answer.count;

      if (score == null || count == null || score < 1 || score > _maxScore) {
        continue;
      }

      countsByScore[score] = (countsByScore[score] ?? 0) + count;

      if (answer.answerText.isNotEmpty && !answerLabels.containsKey(score)) {
        answerLabels[score] = answer.answerText;
      }
    }

    // Generate data sorted by descending score (5→1) so segments are displayed clockwise
    final result = List.generate(_maxScore, (i) {
      final score = _maxScore - i; // Trier décroissant: 5, 4, 3, 2, 1
      return _PieChartData(
        label: QvstChartUtils.getLabelForScore(score, labels: answerLabels),
        count: countsByScore[score] ?? 0,
        color: QvstChartUtils.getColorForScore(score, isReversed: isReversed),
      );
    }).where((data) => data.count > 0).toList();

    return result;
  }

  void _toggleQuestion(String questionId) {
    setState(() {
      if (_selectedQuestionIds.contains(questionId)) {
        _selectedQuestionIds.remove(questionId);
      } else {
        _selectedQuestionIds.add(questionId);
      }
    });
  }
}

class _PieChartData {
  final String label;
  final int count;
  final Color color;

  _PieChartData({
    required this.label,
    required this.count,
    required this.color,
  });
}
