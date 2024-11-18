import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/data/enum/qvst_campaign_status.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstStatusOfCampaignAndButton extends ConsumerStatefulWidget {
  final String campaignId;
  final QvstStatsEntity stats;

  const QvstStatusOfCampaignAndButton({
    super.key,
    required this.campaignId,
    required this.stats,
  });

  @override
  ConsumerState<QvstStatusOfCampaignAndButton> createState() =>
      _QvstStatusOfCampaignAndButtonState();
}

class _QvstStatusOfCampaignAndButtonState
    extends ConsumerState<QvstStatusOfCampaignAndButton> {
  @override
  Widget build(BuildContext context) {
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
            "Statut de la campagne : ${widget.stats.campaignStatus}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(width: 50),
          if (!widget.stats.campaignStatus.isArchived)
            buttonForCampaignStatus(
              ref: ref,
              context: context,
              campaignId: widget.campaignId,
              stats: widget.stats,
            ),
        ],
      ),
    );
  }

  Widget buttonForCampaignStatus({
    required WidgetRef ref,
    required BuildContext context,
    required String campaignId,
    required QvstStatsEntity stats,
  }) {
    String buttonText = "";
    String statusUpdated;

    switch (stats.campaignStatus.toUpperCase()) {
      case draftCampaignStatus:
        buttonText = "Ouvrir la campagne";
        statusUpdated = QvstCampaignStatusEnum.open.name;
        break;
      case openCampaignStatus:
        buttonText = "Fermer la campagne";
        statusUpdated = QvstCampaignStatusEnum.closed.name;
        break;
      case closedCampaignStatus:
        buttonText = "Archiver la campagne";
        statusUpdated = QvstCampaignStatusEnum.archived.name;
        break;
      default:
        buttonText = "";
        statusUpdated = QvstCampaignStatusEnum.archived.name;
    }

    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      width: 200,
      child: Button(
        text: buttonText,
        onPressed: () async {
          updateCampaignStatus(
              context: context,
              ref: ref,
              campaignId: campaignId,
              statusUpdated: statusUpdated,
              actionDefaultValue: stats.action);
        },
        color: kDefaultXpehoColor,
      ),
    );
  }

  Future<void> updateCampaignStatus({
    required BuildContext context,
    required WidgetRef ref,
    required String campaignId,
    required String statusUpdated,
    String? actionDefaultValue,
  }) async {
    try {
      final qvstService = ref.read(qvstServiceProvider);
      final action = ref.read(commentForCampaignNotifier) ?? actionDefaultValue;
      final bool campaignUpdated = await qvstService.updateStatusOfCampaign(
        id: campaignId,
        status: statusUpdated,
        action: action,
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
        ref.refresh(
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
