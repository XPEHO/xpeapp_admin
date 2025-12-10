import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_stats_table_view.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/custom_text_field.dart';
import 'package:xpeapp_admin/presentation/widgets/qvst/qvst_status_of_campaign_and_button.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstStatsTab extends ConsumerWidget {
  final String campaignId;
  final QvstStatsEntity data;
  final TextEditingController controller;
  final String startDateFormatter;
  final String endDateFormatter;

  const QvstStatsTab({
    super.key,
    required this.campaignId,
    required this.data,
    required this.controller,
    required this.startDateFormatter,
    required this.endDateFormatter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  campaignId: campaignId,
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
                  _buildResultLinkSection(context, ref)
                else
                  const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultLinkSection(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Lien des résultats : ",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 20),
          CustomTextField(
            width: 300,
            hintText: "Lien",
            controller: controller,
            onChanged: (value) {
              ref.read(commentForCampaignNotifier.notifier).setComment(value);
            },
          ),
          const SizedBox(width: 20),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            width: 200,
            child: Button(
              text: "Enregistrer",
              onPressed: () async {
                await _updateCampaignResultLink(context, ref);
              },
              color: kDefaultXpehoColor,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateCampaignResultLink(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final qvstService = ref.read(qvstServiceProvider);
      final bool campaignUpdated = await qvstService.updateStatusOfCampaign(
        id: campaignId,
        status: data.campaignStatus,
        action: controller.text,
      );
      if (campaignUpdated) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Statut de la campagne mis à jour'),
          ),
        );
        ref.invalidate(qvstCampaignsProvider);
        ref.invalidate(qvstCampaignStatsProvider(campaignId));
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
      debugPrint(e.toString());
    }
  }
}
