import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_filter_menu.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstFloatingActionButtons extends ConsumerWidget {
  final QvstStatsEntity data;
  final String? campaignId;
  final int tabIndex;
  final bool isFilterMenuOpen;
  final VoidCallback onFilterToggle;

  const QvstFloatingActionButtons({
    super.key,
    required this.data,
    required this.campaignId,
    required this.tabIndex,
    required this.isFilterMenuOpen,
    required this.onFilterToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (tabIndex == 1)
          QvstFilterMenu(
            isOpen: isFilterMenuOpen,
          ),
        if (tabIndex == 1) const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (data.campaignStatus.isArchived || data.campaignStatus.isClosed)
              _buildExportButton(context, ref),
            if (data.campaignStatus.isArchived || data.campaignStatus.isClosed)
              const SizedBox(width: 10),
            _buildResetQuestionsButton(context, ref),
            const SizedBox(width: 10),
            if (tabIndex == 1) _buildFilterButton(),
            if (tabIndex == 1) const SizedBox(width: 10),
            _buildRefreshButton(ref),
          ],
        ),
      ],
    );
  }

  Widget _buildExportButton(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: "Exporter les réponses de la campagne",
      child: FloatingActionButton(
        heroTag: "export_button",
        onPressed: () => _handleExportCSV(context, ref),
        backgroundColor: kDefaultXpehoColor,
        child: const Icon(Icons.file_download, color: Colors.white),
      ),
    );
  }

  Widget _buildResetQuestionsButton(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: "Réinitialiser les questions inversées",
      child: FloatingActionButton(
        heroTag: "reset_questions_button",
        onPressed: () => _handleResetQuestions(context, ref),
        backgroundColor: Colors.orange,
        child: const Icon(Icons.clear_all, color: Colors.white),
      ),
    );
  }

  Widget _buildFilterButton() {
    return Tooltip(
      message: "Filtrer les graphiques",
      child: FloatingActionButton(
        heroTag: "filter_button",
        onPressed: onFilterToggle,
        backgroundColor: isFilterMenuOpen ? Colors.orange : kDefaultXpehoColor,
        child: Icon(
          isFilterMenuOpen ? Icons.close : Icons.dashboard,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildRefreshButton(WidgetRef ref) {
    return Tooltip(
      message: "Recharger les statistiques",
      child: FloatingActionButton(
        heroTag: "refresh_button",
        onPressed: () => _handleRefresh(ref),
        backgroundColor: kDefaultXpehoColor,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }

  void _handleExportCSV(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(qvstServiceProvider).exportCSVFile(
            campaignId ?? "",
            ref.watch(userProvider)?.token?.token ?? "",
          );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("$e")),
      );
    }
  }

  void _handleResetQuestions(BuildContext context, WidgetRef ref) {
    ref.read(reversedQuestionsProvider.notifier).state = {};
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Questions inversées réinitialisées"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleRefresh(WidgetRef ref) {
    if (campaignId != null) {
      ref.invalidate(qvstCampaignStatsProvider(campaignId!));
      ref.invalidate(qvstCampaignAnalysisProvider(campaignId!));
    }
  }
}
