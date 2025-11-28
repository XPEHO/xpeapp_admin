import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/at_risk_employees_widget.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/global_distribution_pie_chart.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/global_stats_card.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/questions_analysis_chart.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/questions_detailed_chart.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstContentAnalysis extends ConsumerStatefulWidget {
  final String? campaignId;

  static const EdgeInsets _pagePadding = EdgeInsets.all(16);
  static const double _sectionSpacing = 16.0;
  static const double _bottomPadding = 80.0;

  const QvstContentAnalysis({super.key, this.campaignId});

  @override
  ConsumerState<QvstContentAnalysis> createState() =>
      _QvstContentAnalysisState();
}

class _QvstContentAnalysisState extends ConsumerState<QvstContentAnalysis> {
  @override
  Widget build(BuildContext context) {
    if (widget.campaignId?.isEmpty ?? true) {
      return _buildNoCampaignState();
    }

    final analysis =
        ref.watch(qvstCampaignAnalysisProvider(widget.campaignId!));
    final reversedQuestions = ref.watch(reversedQuestionsProvider);
    final chartsVisibility = ref.watch(analysisChartsVisibilityProvider);

    return analysis.when(
      data: (data) =>
          _buildAnalysisContent(data, reversedQuestions, chartsVisibility),
      error: _buildErrorState,
      loading: _buildLoadingState,
    );
  }

  Widget _buildNoCampaignState() {
    return const Text('Aucune campagne sélectionnée');
  }

  Widget _buildAnalysisContent(
    dynamic data,
    Map<String, bool> reversedQuestions,
    Map<String, bool> chartsVisibility,
  ) {
    final qvstService = ref.read(qvstServiceProvider);
    final adjustedData =
        qvstService.applyReversedQuestions(data, reversedQuestions);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: QvstContentAnalysis._pagePadding,
        child: ListView(
          children: [
            _buildGlobalStatsSection(adjustedData, chartsVisibility),
            _buildQuestionsAnalysisSection(adjustedData, chartsVisibility),
            _buildGlobalDistributionSection(adjustedData, chartsVisibility),
            _buildQuestionsDetailedSection(adjustedData, chartsVisibility),
            _buildAtRiskEmployeesSection(adjustedData, chartsVisibility),
            const SizedBox(height: QvstContentAnalysis._bottomPadding),
          ],
        ),
      ),
    );
  }

  Widget _buildGlobalStatsSection(
      dynamic adjustedData, Map<String, bool> chartsVisibility) {
    if (!_isChartVisible('globalStats', chartsVisibility)) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: GlobalStatsCard(globalStats: adjustedData.globalStats),
            ),
          ],
        ),
        const SizedBox(height: QvstContentAnalysis._sectionSpacing),
      ],
    );
  }

  Widget _buildQuestionsAnalysisSection(
      dynamic adjustedData, Map<String, bool> chartsVisibility) {
    final showQuestions =
        _isChartVisible('questionsAnalysis', chartsVisibility);

    if (!showQuestions) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: QuestionsAnalysisChart(
                questionsAnalysis: adjustedData.questionsAnalysis,
                title: 'Toutes les questions',
              ),
            ),
          ],
        ),
        const SizedBox(height: QvstContentAnalysis._sectionSpacing),
      ],
    );
  }

  Widget _buildGlobalDistributionSection(
      dynamic adjustedData, Map<String, bool> chartsVisibility) {
    if (!_isChartVisible('globalDistribution', chartsVisibility)) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GlobalDistributionPieChart(
                distribution: adjustedData.globalDistribution ?? [],
                answerLabels: _extractAnswerLabels(adjustedData),
              ),
            ),
          ],
        ),
        SizedBox(height: QvstContentAnalysis._sectionSpacing),
      ],
    );
  }

  Widget _buildQuestionsDetailedSection(
      dynamic adjustedData, Map<String, bool> chartsVisibility) {
    if (!_isChartVisible('questionsDetailed', chartsVisibility)) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        QuestionsDetailedChart(
          questionsAnalysis: adjustedData.questionsRequiringAction,
        ),
        const SizedBox(height: QvstContentAnalysis._sectionSpacing),
      ],
    );
  }

  Widget _buildAtRiskEmployeesSection(
      dynamic adjustedData, Map<String, bool> chartsVisibility) {
    if (!_isChartVisible('atRiskEmployees', chartsVisibility)) {
      return const SizedBox.shrink();
    }

    return AtRiskEmployeesWidget(
      atRiskEmployees: adjustedData.atRiskEmployees,
    );
  }

  bool _isChartVisible(String chartKey, Map<String, bool> chartsVisibility) {
    return chartsVisibility[chartKey] ?? true;
  }

  Map<int, String>? _extractAnswerLabels(dynamic adjustedData) {
    if (adjustedData.questionsRequiringAction.isEmpty) return null;

    return {
      for (final a in adjustedData.questionsRequiringAction.first.answers)
        if (a.score != null && a.answerText.isNotEmpty) a.score!: a.answerText
    };
  }

  Widget _buildErrorState(Object err, StackTrace stack) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text("Erreur"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: QvstContentAnalysis._pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 48, color: Colors.red),
              const SizedBox(height: QvstContentAnalysis._sectionSpacing),
              Text(
                "Erreur lors de la récupération de l'analyse",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                err.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
