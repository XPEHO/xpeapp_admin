import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/qvst_campaign_status.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstStatusOfCampaignAndButton extends ConsumerWidget {
  final String campaignId;
  final String campaignStatus;

  const QvstStatusOfCampaignAndButton({
    super.key,
    required this.campaignId,
    required this.campaignStatus,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Statut de la campagne : $campaignStatus",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(width: 50),
          if (!campaignStatus.isArchived)
            buttonForCampaignStatus(
              ref: ref,
              context: context,
              campaignId: campaignId,
              campaignStatus: campaignStatus,
            ),
        ],
      ),
    );
  }

  Widget buttonForCampaignStatus({
    required WidgetRef ref,
    required BuildContext context,
    required String campaignId,
    required String campaignStatus,
  }) {
    String buttonText = "";

    switch (campaignStatus.toUpperCase()) {
      case draftCampaignStatus:
        buttonText = "Ouvrir la campagne";
      case openCampaignStatus:
        buttonText = "Fermer la campagne";
      case closedCampaignStatus:
        buttonText = "Archiver la campagne";
      default:
        buttonText = "";
    }
    String statusUpdated =
        (campaignStatus.toUpperCase() == QvstCampaignStatusEnum.draft.name)
            ? QvstCampaignStatusEnum.open.name
            : (campaignStatus.toUpperCase() == QvstCampaignStatusEnum.open.name)
                ? QvstCampaignStatusEnum.closed.name
                : QvstCampaignStatusEnum.archived.name;
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      width: 200,
      child: Button(
        text: buttonText,
        onPressed: () async {
          try {
            final qvstService = ref.read(qvstServiceProvider);
            final bool campaignUpdated =
                await qvstService.updateStatusOfCampaign(
              campaignId,
              statusUpdated,
            );
            if (campaignUpdated) {
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Statut de la campagne mis à jour'),
                ),
              );
              // ignore: unused_result
              ref.refresh(qvstCampaignsProvider);
              // ignore: unused_result
              ref.refresh(qvstCampaignStatsProvider(campaignId));
            } else {
              throw Exception('Erreur lors de la mise à jour du statut');
            }
          } catch (e) {
            debugPrint(
              e.toString(),
            );
          }
        },
        color: kDefaultXpehoColor,
      ),
    );
  }
}
