import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_analysis.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_floating_action_buttons.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_stats_tab.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstContentStats extends ConsumerStatefulWidget {
  final String? campaignId;

  const QvstContentStats({
    super.key,
    this.campaignId,
  });

  @override
  ConsumerState<QvstContentStats> createState() => _QvstContentStatsState();
}

class _QvstContentStatsState extends ConsumerState<QvstContentStats> {
  bool _isFilterMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    if (widget.campaignId == null || widget.campaignId!.isEmpty) {
      return const Text('Aucune campagne sélectionnée');
    }
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    final stats = ref.watch(qvstCampaignStatsProvider(widget.campaignId!));
    final controller = TextEditingController();

    return stats.when(
      data: (data) {
        final formatter = DateFormat('dd/MM/yyyy');
        final startDate =
            data.startDate != null ? formatter.format(data.startDate!) : '';
        final endDate =
            data.endDate != null ? formatter.format(data.endDate!) : '';
        controller.text = data.action ?? "";

        return DefaultTabController(
          length: 2,
          child: Builder(
            builder: (context) {
              final tabIndex = DefaultTabController.of(context).index;

              // Fermer le menu si on quitte l'onglet analyse
              if (tabIndex != 1 && _isFilterMenuOpen) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() => _isFilterMenuOpen = false);
                });
              }

              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                      'Statistiques de la campagne : ${data.campaignName}'),
                  backgroundColor: Colors.white,
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.table_chart), text: 'Statistiques'),
                      Tab(icon: Icon(Icons.analytics), text: 'Analyse avancée'),
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
                body: TabBarView(
                  children: [
                    QvstStatsTab(
                      campaignId: widget.campaignId!,
                      data: data,
                      controller: controller,
                      startDateFormatter: startDate,
                      endDateFormatter: endDate,
                    ),
                    QvstContentAnalysis(campaignId: widget.campaignId),
                  ],
                ),
                floatingActionButton: AnimatedBuilder(
                  animation: DefaultTabController.of(context),
                  builder: (context, _) {
                    return QvstFloatingActionButtons(
                      data: data,
                      campaignId: widget.campaignId,
                      tabIndex: DefaultTabController.of(context).index,
                      isFilterMenuOpen: _isFilterMenuOpen,
                      onFilterToggle: () {
                        setState(() => _isFilterMenuOpen = !_isFilterMenuOpen);
                      },
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      error: (error, stack) =>
          const Text('Erreur lors de la récupération des stats'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
