import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_stats_table_view.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/custom_text_field.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/qvst_status_of_campaign_and_button.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstContentStats extends ConsumerWidget {
  final String? campaignId;

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

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Statistiques de la campagne : ${data.campaignName}'),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Column(
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
                      QvstStatsTableView(
                        stats: data,
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
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (data.campaignStatus.isArchived ||
                  data.campaignStatus.isClosed)
                Tooltip(
                  message: "Exporter les réponses de la campagne",
                  child: FloatingActionButton(
                    onPressed: () async {
                      try {
                        await ref.read(qvstServiceProvider).exportCSVFile(
                              campaignId ?? "",
                              ref.watch(userProvider)?.token?.token ?? "",
                            );
                      } catch (e) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$e"),
                          ),
                        );
                      }
                    },
                    backgroundColor: kDefaultXpehoColor,
                    child: const Icon(
                      Icons.file_download,
                      color: Colors.white,
                    ),
                  ),
                ),
              const SizedBox(width: 10),
              Tooltip(
                message: "Recharger les statistiques",
                child: FloatingActionButton(
                  onPressed: () {
                    ref.invalidate(
                      qvstCampaignStatsProvider(
                        campaignId!,
                      ),
                    );
                  },
                  backgroundColor: kDefaultXpehoColor,
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stack) => const Text(
        'Erreur lors de la récupération des stats',
      ),
      loading: () => const CircularProgressIndicator(),
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
}
