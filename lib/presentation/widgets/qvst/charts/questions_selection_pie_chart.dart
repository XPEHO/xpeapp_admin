import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/data/utils/qvst_chart_utils.dart';
import 'package:xpeapp_admin/data/utils/qvst_ui_utils.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class QuestionsSelectionPieChart extends StatefulWidget {
  final List<QuestionAnalysisEntity> questionsAnalysis;

  const QuestionsSelectionPieChart({
    super.key,
    required this.questionsAnalysis,
  });

  @override
  State<QuestionsSelectionPieChart> createState() =>
      _QuestionsSelectionPieChartState();
}

class _QuestionsSelectionPieChartState
    extends State<QuestionsSelectionPieChart> {
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

    final chartData = _buildChartData(selectedQuestions);

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
              child: _buildPieChart(selectedQuestions, chartData),
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

  Widget _buildPieChart(
    List<QuestionAnalysisEntity> selectedQuestions,
    List<_PieChartData> chartData,
  ) {
    final totalResponses =
        chartData.fold<int>(0, (sum, item) => sum + item.count);

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
        SizedBox(
          height: 380,
          child: SfCircularChart(
            legend: const Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
            ),
            series: <CircularSeries>[
              PieSeries<_PieChartData, String>(
                dataSource: chartData,
                xValueMapper: (data, _) => data.label,
                yValueMapper: (data, _) => data.count,
                pointColorMapper: (data, _) => data.color,
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
                final data = raw as _PieChartData;
                final pct = totalResponses == 0
                    ? 0.0
                    : (data.count / totalResponses) * 100;
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${data.label}\n${data.count} réponses\n${QvstFormatters.formatPercentage(pct)}',
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        const QvstInfoBanner(
          text:
              'Camembert basé sur la sélection de questions (agrégation des réponses).',
        ),
      ],
    );
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

  List<_PieChartData> _buildChartData(
      List<QuestionAnalysisEntity> selectedQuestions) {
    final countsByScore = <int, int>{for (var i = 1; i <= _maxScore; i++) i: 0};
    final answerLabels = <int, String>{};

    for (final question in selectedQuestions) {
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
    }

    return List.generate(_maxScore, (i) {
      final score = i + 1;
      return _PieChartData(
        label: QvstChartUtils.getLabelForScore(score, labels: answerLabels),
        count: countsByScore[score] ?? 0,
        color: QvstChartUtils.getColorForScore(score),
      );
    }).where((data) => data.count > 0).toList();
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
