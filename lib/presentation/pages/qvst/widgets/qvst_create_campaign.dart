import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_choice_multiple_themes.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_questions_list_for_campaign.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Création de campagne'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Remplissez les informations pour créer une nouvelle campagne QVST',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  _getText(
                    'Choisissez les thèmes : ',
                    color: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const QvstChoiceMultipleThemes(),
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
                    child: Builder(builder: (context) {
                      final campaignNameEmpty =
                          campaignNameController.text.isEmpty;
                      final themesEmpty =
                          ref.watch(qvstThemesSelectionProvider).isEmpty;
                      final questionsEmpty =
                          ref.watch(qvstQuestionsForCampaignProvider).isEmpty;
                      final startDateNull = startDate == null;
                      final endDateNull = endDate == null;

                      final isDisabled = campaignNameEmpty ||
                          themesEmpty ||
                          questionsEmpty ||
                          startDateNull ||
                          endDateNull;

                      return Button.secondary(
                        text: 'Créer',
                        onPressed: isDisabled
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
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Tooltip(
        message: 'Revenir aux campagnes',
        child: FloatingActionButton(
          onPressed: () {
            // Nettoyer les sélections avant de revenir aux campagnes
            ref.read(qvstThemesSelectionProvider.notifier).reset();
            ref.read(qvstQuestionsForCampaignProvider.notifier).reset();
            widget.onDismissed();
          },
          backgroundColor: kDefaultXpehoColor,
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
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

  Future<void> _creationOfCampaign({
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
    final themesSelected = ref.watch(qvstThemesSelectionProvider);
    if (themesSelected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner au moins un thème'),
        ),
      );
      return;
    }

    ref.read(loaderStateProvider.notifier).showLoader();

    final response = await ref.read(qvstServiceProvider).addQvstCampaign(
          campaignName: campaignNameController.text,
          themesSelected: themesSelected,
          startDate: startDate!,
          endDate: endDate!,
          questions: ref.watch(qvstQuestionsForCampaignProvider),
        );
    if (response) {
      ref.read(loaderStateProvider.notifier).hideLoader();
      ref.invalidate(qvstCampaignsProvider);
      ref.read(qvstThemesSelectionProvider.notifier).reset();
      widget.onDismissed();
    } else {
      ref.read(loaderStateProvider.notifier).hideLoader();
      onError();
    }
  }
}
