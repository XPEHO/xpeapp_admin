import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/qvst_campaign_status.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstStatusOfCampaignAndButton extends ConsumerStatefulWidget {
  final String campaignId;
  final String campaignStatus;

  const QvstStatusOfCampaignAndButton({
    super.key,
    required this.campaignId,
    required this.campaignStatus,
  });

  @override
  ConsumerState<QvstStatusOfCampaignAndButton> createState() =>
      _QvstStatusOfCampaignAndButtonState();
}

class _QvstStatusOfCampaignAndButtonState
    extends ConsumerState<QvstStatusOfCampaignAndButton> {
  String commentOfCampaign = "";

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
            "Statut de la campagne : ${widget.campaignStatus}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(width: 50),
          if (!widget.campaignStatus.isArchived)
            buttonForCampaignStatus(
              ref: ref,
              context: context,
              campaignId: widget.campaignId,
              campaignStatus: widget.campaignStatus,
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
    TextEditingController commentController = TextEditingController();

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
          if (statusUpdated == QvstCampaignStatusEnum.archived.name) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Archiver la campagne'),
                  content: TextField(
                    controller: commentController,
                    decoration: const InputDecoration(
                      hintText: 'Commentaire',
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Annuler'),
                    ),
                    TextButton(
                      onPressed: () {
                        updateApiCall(
                          context: context,
                          ref: ref,
                          campaignId: campaignId,
                          statusUpdated: statusUpdated,
                          action: commentController.text,
                        );
                        Navigator.of(context).pop();
                      },
                      child: const Text('Confirmer'),
                    ),
                  ],
                );
              },
            );
          } else {
            updateApiCall(
              context: context,
              ref: ref,
              campaignId: campaignId,
              statusUpdated: statusUpdated,
            );
          }
        },
        color: kDefaultXpehoColor,
      ),
    );
  }

  Future<void> updateApiCall({
    required BuildContext context,
    required WidgetRef ref,
    required String campaignId,
    required String statusUpdated,
    String? action,
  }) async {
    try {
      final qvstService = ref.read(qvstServiceProvider);
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
