import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/at_risk_employees_widget.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/global_distribution_pie_chart.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/global_stats_card.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/questions_analysis_chart.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/questions_detailed_chart.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/charts/themes_analysis_chart.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstContentAnalysis extends ConsumerWidget {
  final String? campaignId;

  const QvstContentAnalysis({super.key, this.campaignId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (campaignId == null || campaignId!.isEmpty) {
      return const Text('Aucune campagne sélectionnée');
    }

    final analysis = ref.watch(qvstCampaignAnalysisProvider(campaignId!));

    return analysis.when(
      data: (data) => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kDefaultXpehoColor,
          tooltip: "Recharger l'analyse",
          onPressed: () =>
              ref.invalidate(qvstCampaignAnalysisProvider(campaignId!)),
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              // ---- GLOBAL STATS ----
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: GlobalStatsCard(globalStats: data.globalStats),
                  ),
                ],
              ),

              // ---- PIE CHART ----
              Row(
                children: [
                  Expanded(
                    child: GlobalDistributionPieChart(
                      distribution: data.globalDistribution,
                      answerLabels: data.questionsRequiringAction.isNotEmpty
                          ? {
                              for (final a in data
                                  .questionsRequiringAction.first.answers)
                                if (a.score != null && a.answerText.isNotEmpty)
                                  a.score!: a.answerText
                            }
                          : null,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ---- THEMES + QUESTIONS ----
              Row(
                children: [
                  Expanded(
                    child: ThemesAnalysisChart(
                      themesAnalysis: data.themesAnalysis,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: QuestionsAnalysisChart(
                      questionsAnalysis: data.questionsRequiringAction,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ---- QUESTIONS DÉTAILLÉES ----
              QuestionsDetailedChart(
                questionsAnalysis: data.questionsRequiringAction,
              ),

              const SizedBox(height: 16),

              // ---- EMPLOYÉS À RISQUE ----
              AtRiskEmployeesWidget(
                atRiskEmployees: data.atRiskEmployees,
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // ---- ERROR VIEW ----
      error: (err, stack) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Erreur"),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  "Erreur lors de la récupération de l'analyse",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(err.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text(
                  stack.toString(),
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),

      // ---- LOADING ----
      loading: () => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
