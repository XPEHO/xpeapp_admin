import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_choice_theme.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_questions_list_for_campaign.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstCreateCampaign extends ConsumerStatefulWidget {
  final VoidCallback onDismissed;
  const QvstCreateCampaign({
    super.key,
    required this.onDismissed,
  });

  @override
  ConsumerState<QvstCreateCampaign> createState() =>
      _QvstCreateCampaignDialogState();
}

class _QvstCreateCampaignDialogState extends ConsumerState<QvstCreateCampaign> {
  DateTime? startDate;
  DateTime? endDate;

  final campaignNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat('dd/MM/yyyy');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 250,
                  child: Button(
                    text: 'Revenir aux campagnes',
                    onPressed: () => widget.onDismissed(),
                    color: kDefaultXpehoColor,
                  ),
                ),
                const SizedBox(width: 50),
                Text(
                  'Créer une campagne',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _getText(
            'Choisissez un nom de campagne : ',
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: 500,
            child: TextField(
              controller: campaignNameController,
              decoration: InputDecoration(
                hintText: 'Nom de la campagne',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _getText(
                'Choisissez un thème : ',
                color: Colors.black,
              ),
              const SizedBox(width: 20),
              const QvstChoiceTheme(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _getText(
                'Choisissez une date de début: ',
                color: Colors.black,
              ),
              const SizedBox(width: 20),
              (startDate == null)
                  ? IconButton(
                      onPressed: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      ).then((value) {
                        setState(() {
                          startDate = value;
                        });
                      }),
                      icon: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                          ),
                          const SizedBox(width: 10),
                          _getText(
                            'Aucune date',
                            size: 16,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    )
                  : TextButton(
                      onPressed: () => showDatePicker(
                        context: context,
                        initialDate: startDate ?? DateTime.now(),
                        firstDate: startDate ?? DateTime.now(),
                        lastDate: DateTime(2030),
                      ).then((value) {
                        setState(() {
                          startDate = value;
                        });
                      }),
                      child: _getText(
                        dateFormatted.format(startDate!),
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _getText(
                'Choisissez une date de fin: ',
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              (endDate == null)
                  ? IconButton(
                      onPressed: () => showDatePicker(
                        context: context,
                        initialDate: startDate ?? DateTime.now(),
                        firstDate: startDate ?? DateTime.now(),
                        lastDate: DateTime(2030),
                      ).then((value) {
                        setState(() {
                          endDate = value;
                        });
                      }),
                      icon: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                          ),
                          const SizedBox(width: 10),
                          _getText(
                            'Aucune date',
                            size: 16,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    )
                  : TextButton(
                      onPressed: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      ).then((value) {
                        setState(() {
                          endDate = value;
                        });
                      }),
                      child: _getText(
                        dateFormatted.format(endDate!),
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
            ],
          ),
          const SizedBox(height: 20),
          _getText(
            'Choisissez la liste des questions :',
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          const QvstQuestionsListForCampaign(),
          Container(
            margin: const EdgeInsets.only(
              top: 30,
              bottom: 30,
              left: 50,
            ),
            width: 200,
            child: Button.secondary(
              text: 'Créer',
              onPressed: (campaignNameController.text.isEmpty ||
                      ref.watch(qvstNotifierProvider) == null ||
                      ref.watch(qvstQuestionsForCampaignProvider).isEmpty ||
                      startDate == null ||
                      endDate == null)
                  ? null
                  : () => _creationOfCampaign(
                        onError: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Erreur lors de la création de la campagne'),
                            ),
                          );
                        },
                      ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getText(
    String text, {
    double? size = 16,
    Color? color = Colors.white,
  }) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      );

  _creationOfCampaign({
    required VoidCallback onError,
  }) async {
    if (startDate!.isAfter(endDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('La date de début doit être avant la date de fin'),
        ),
      );
      return;
    }
    final themeSelected = ref.watch(qvstNotifierProvider);
    ref.read(loaderStateProvider.notifier).showLoader();

    final response = await ref.read(qvstServiceProvider).addQvstCampaign(
          campaignName: campaignNameController.text,
          themeSelected: themeSelected!,
          startDate: startDate!,
          endDate: endDate!,
          questions: ref.watch(qvstQuestionsForCampaignProvider),
        );
    if (response) {
      ref.read(loaderStateProvider.notifier).hideLoader();
      // ignore: unused_result
      ref.refresh(qvstCampaignsProvider);
      widget.onDismissed();
    } else {
      ref.read(loaderStateProvider.notifier).hideLoader();
      onError();
    }
  }
}
