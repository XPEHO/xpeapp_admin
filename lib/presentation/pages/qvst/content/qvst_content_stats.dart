import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_analysis.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_stats_table_view.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/custom_text_field.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/qvst_status_of_campaign_and_button.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstContentStats extends ConsumerWidget {
  final String? campaignId;

  // Configuration des graphiques
  static const _chartsConfig = {
    'globalStats': {'name': 'Statistiques', 'icon': Icons.analytics},
    'questionsAnalysis': {'name': 'Questions', 'icon': Icons.quiz},
    'globalDistribution': {'name': 'Répartition', 'icon': Icons.pie_chart},
    'questionsDetailed': {'name': 'Détails', 'icon': Icons.bar_chart},
    'atRiskEmployees': {'name': 'Collaborateurs', 'icon': Icons.warning},
  };

  const QvstContentStats({
    super.key,
    this.campaignId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (campaignId != null && (campaignId ?? "").isNotEmpty) {
      return _getStatsOfCampaignWidget(context, ref);
    } else {
      return const Text('Aucune campagne sélectionnée');
    }
  }

  Widget _getStatsOfCampaignWidget(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(
      qvstCampaignStatsProvider(campaignId!),
    );
    final TextEditingController controller = TextEditingController();
    return stats.when(
      data: (data) {
        final formatter = DateFormat('dd/MM/yyyy');
        final startDateFormatter = formatter.format(
          DateTime.parse(data.startDate),
        );
        final endDateFormatter = formatter.format(
          DateTime.parse(data.endDate),
        );
        controller.text = data.action ?? "";

        return DefaultTabController(
          length: 2,
          child: Builder(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                      'Statistiques de la campagne : ${data.campaignName}'),
                  backgroundColor: Colors.white,
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.table_chart),
                        text: 'Statistiques',
                      ),
                      Tab(
                        icon: Icon(Icons.analytics),
                        text: 'Analyse avancée',
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
                body: TabBarView(
                  children: [
                    // Onglet Statistiques
                    _buildStatsTab(
                      context,
                      ref,
                      data,
                      controller,
                      startDateFormatter,
                      endDateFormatter,
                    ),
                    // Onglet Analyse
                    QvstContentAnalysis(campaignId: campaignId),
                  ],
                ),
                floatingActionButton: AnimatedBuilder(
                  animation: DefaultTabController.of(context),
                  builder: (context, _) {
                    return _buildFloatingActionButtons(
                      data,
                      campaignId,
                      ref,
                      DefaultTabController.of(context).index,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      error: (error, stack) => const Text(
        'Erreur lors de la récupération des stats',
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildStatsTab(
    BuildContext context,
    WidgetRef ref,
    QvstStatsEntity data,
    TextEditingController controller,
    String startDateFormatter,
    String endDateFormatter,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        subtitleWidget(
          'Faîtes évoluer l\'état de la campagne, publiez ses résultats ou consultez ses statistiques',
        ),
        const Divider(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                QvstStatusOfCampaignAndButton(
                  campaignId: campaignId!,
                  stats: data,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Date de début : $startDateFormatter",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Date de fin : $endDateFormatter",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 40,
                    ),
                    child: QvstStatsTableView(
                      stats: data,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (data.campaignStatus.isArchived)
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Lien des résultats : ",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 20),
                        CustomTextField(
                          width: 300,
                          hintText: "Lien",
                          controller: controller,
                          onChanged: (value) {
                            ref
                                .read(commentForCampaignNotifier.notifier)
                                .setComment(
                                  value,
                                );
                          },
                        ),
                        const SizedBox(width: 20),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                          ),
                          width: 200,
                          child: Button(
                            text: "Enregistrer",
                            onPressed: () async {
                              updateCampaignResultLink(
                                context: context,
                                ref: ref,
                                campaignId: campaignId!,
                                stats: data,
                                actionUpdated: controller.text,
                              );
                            },
                            color: kDefaultXpehoColor,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> updateCampaignResultLink({
    required BuildContext context,
    required WidgetRef ref,
    required String campaignId,
    required QvstStatsEntity stats,
    required String? actionUpdated,
  }) async {
    try {
      final qvstService = ref.read(qvstServiceProvider);
      final action = actionUpdated;
      final bool campaignUpdated = await qvstService.updateStatusOfCampaign(
        id: campaignId,
        status: stats.campaignStatus,
        action: action,
      );
      if (campaignUpdated) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Statut de la campagne mis à jour'),
          ),
        );
        ref.invalidate(qvstCampaignsProvider);
        ref.invalidate(
          qvstCampaignStatsProvider(
            campaignId,
          ),
        );
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Erreur lors de la mise à jour du statut de la campagne'),
          ),
        );
      }
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    }
  }

  Widget _buildFloatingActionButtons(
    QvstStatsEntity data,
    String? campaignId,
    WidgetRef ref,
    int tabIndex,
  ) {
    // Fermer le menu de filtre si on n'est pas sur l'onglet analyse
    if (tabIndex != 1 && ref.read(filterMenuProvider)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(filterMenuProvider.notifier).close();
      });
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Menu de filtres flottant (seulement dans l'onglet analyse) - AU-DESSUS
        if (tabIndex == 1) _buildFilterMenu(ref),
        if (tabIndex == 1) const SizedBox(height: 16),
        // Row des boutons principaux
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (data.campaignStatus.isArchived || data.campaignStatus.isClosed)
              Tooltip(
                message: "Exporter les réponses de la campagne",
                child: FloatingActionButton(
                  heroTag: "export_button",
                  onPressed: () => _handleExportCSV(ref, campaignId),
                  backgroundColor: kDefaultXpehoColor,
                  child: const Icon(
                    Icons.file_download,
                    color: Colors.white,
                  ),
                ),
              ),
            if (data.campaignStatus.isArchived || data.campaignStatus.isClosed)
              const SizedBox(width: 10),
            _buildFloatingActionButton(
              tooltip: "Réinitialiser les questions inversées",
              heroTag: "reset_questions_button",
              onPressed: () => _handleResetQuestions(ref),
              backgroundColor: Colors.orange,
              icon: Icons.clear_all,
            ),
            const SizedBox(width: 10),
            // Bouton de filtre des graphiques (seulement dans l'onglet analyse)
            if (tabIndex == 1)
              Tooltip(
                message: "Filtrer les graphiques",
                child: FloatingActionButton(
                  heroTag: "filter_button",
                  onPressed: () {
                    ref.read(filterMenuProvider.notifier).toggle();
                  },
                  backgroundColor: ref.watch(filterMenuProvider)
                      ? Colors.orange
                      : kDefaultXpehoColor,
                  child: Icon(
                    ref.watch(filterMenuProvider)
                        ? Icons.close
                        : Icons.dashboard,
                    color: Colors.white,
                  ),
                ),
              ),
            if (tabIndex == 1) const SizedBox(width: 10),
            _buildFloatingActionButton(
              tooltip: "Recharger les statistiques",
              heroTag: "refresh_button",
              onPressed: () => _handleRefresh(ref, campaignId),
              backgroundColor: kDefaultXpehoColor,
              icon: Icons.refresh,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterMenu(WidgetRef ref) {
    final isMenuOpen = ref.watch(filterMenuProvider);
    final chartsVisibility = ref.watch(analysisChartsVisibilityProvider);
    final visibleCount = chartsVisibility.values.where((v) => v).length;

    if (!isMenuOpen) return const SizedBox.shrink();

    const charts = _chartsConfig;

    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // En-tête
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kDefaultXpehoColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.dashboard, color: Colors.white, size: 16),
                const SizedBox(width: 6),
                Text(
                  'Graphiques ($visibleCount/${charts.length})',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          // Liste des graphiques
          ...charts.entries.map((entry) {
            final key = entry.key;
            final chart = entry.value;
            final isVisible = chartsVisibility[key] ?? true;

            return InkWell(
              onTap: () {
                ref
                    .read(analysisChartsVisibilityProvider.notifier)
                    .toggleChart(key);
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: isVisible ? kDefaultXpehoColor.withAlpha(13) : null,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withAlpha(20),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      chart['icon'] as IconData,
                      color: isVisible ? kDefaultXpehoColor : Colors.grey,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        chart['name'] as String,
                        style: TextStyle(
                          color: isVisible ? kDefaultXpehoColor : Colors.grey,
                          fontWeight:
                              isVisible ? FontWeight.w500 : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Icon(
                      isVisible
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: isVisible ? kDefaultXpehoColor : Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
              ),
            );
          }),
          // Bouton "Tout" en bas
          InkWell(
            onTap: () {
              ref.read(analysisChartsVisibilityProvider.notifier).toggleAll();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    visibleCount == charts.length
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: kDefaultXpehoColor,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    visibleCount == charts.length
                        ? 'Tout masquer'
                        : 'Tout afficher',
                    style: const TextStyle(
                      color: kDefaultXpehoColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton({
    required String tooltip,
    required String heroTag,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required IconData icon,
  }) {
    return Tooltip(
      message: tooltip,
      child: FloatingActionButton(
        heroTag: heroTag,
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  void _handleExportCSV(WidgetRef ref, String? campaignId) async {
    try {
      await ref.read(qvstServiceProvider).exportCSVFile(
            campaignId ?? "",
            ref.watch(userProvider)?.token?.token ?? "",
          );
    } catch (e) {
      if (!Navigator.of(ref.context).context.mounted) return;
      ScaffoldMessenger.of(ref.context).showSnackBar(
        SnackBar(
          content: Text("$e"),
        ),
      );
    }
  }

  void _handleResetQuestions(WidgetRef ref) {
    ref.read(reversedQuestionsProvider.notifier).state = {};
    ScaffoldMessenger.of(ref.context).showSnackBar(
      const SnackBar(
        content: Text("Questions inversées réinitialisées"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleRefresh(WidgetRef ref, String? campaignId) {
    if (campaignId != null) {
      ref.invalidate(qvstCampaignStatsProvider(campaignId));
      ref.invalidate(qvstCampaignAnalysisProvider(campaignId));
    }
  }
}
