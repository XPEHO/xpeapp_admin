// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/presentation/pages/template/scaffold_template.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class NewsletterAddPage extends ConsumerStatefulWidget {
  const NewsletterAddPage({super.key});

  @override
  ConsumerState<NewsletterAddPage> createState() => _NewsletterAddPageState();
}

class _NewsletterAddPageState extends ConsumerState<NewsletterAddPage> {
  DateTime? dateSelected;
  bool isDateSelected = false;
  bool summaryIsNotEmpty = false;
  bool pdfLinkIsNotEmpty = false;

  final TextEditingController summaryController = TextEditingController();
  final TextEditingController pdfLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      appBarTitle: 'Ajouter une newsletter',
      appBarLeading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isDateSelected)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const ListTile(
                  title: Text(
                    'Choisir la date de la newsletter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    'Ex : 01/01/2023',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            (isDateSelected)
                ? TextButton.icon(
                    onPressed: () => showDatePickerForNewsletter(context),
                    icon: const Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Date sélectionnée : ${dateSelected!.day}/${dateSelected!.month}/${dateSelected!.year}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                : IconButton.outlined(
                    onPressed: () => showDatePickerForNewsletter(context),
                    icon: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 10),
                        Text('Choisir une date'),
                      ],
                    ),
                  ),
            const SizedBox(height: 20),
            ...titleAndTextField(
              title: 'Saisir le sommaire',
              subtitle: '1 ligne = 1 chapitre',
              hintText: 'Ex: Actualités, Sport, Culture, ...',
              controller: summaryController,
              heightOfTextField: MediaQuery.of(context).size.height * 0.3,
              maxLines: 10,
            ),
            const SizedBox(height: 20),
            ...titleAndTextField(
              title: 'Saisir le lien du PDF',
              subtitle: 'Ex: Drive link, ...',
              hintText: 'Ex: Drive link, ...',
              controller: pdfLinkController,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Button.secondary(
                text: 'Ajouter la newsletter',
                onPressed: (isDateSelected &&
                        summaryIsNotEmpty &&
                        pdfLinkIsNotEmpty)
                    ? () async {
                        String summary = summaryController.text.replaceAll(
                          '\n',
                          ',',
                        );
                        NewsletterEntity newsletterEntity = NewsletterEntity(
                          summary: summary,
                          date: Timestamp.fromDate(dateSelected!),
                          pdfUrl: pdfLinkController.text,
                        );
                        sendNewsletter(newsletterEntity);
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDatePickerForNewsletter(BuildContext context) async {
    //
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      currentDate: dateSelected ?? DateTime.now(),
      helpText: MediaQuery.of(context).size.width < 600
          ? 'Choisir la date de la newsletter'
          : 'Date',
      fieldHintText: 'Ex: 01/01/2023',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black,
              onPrimary: kDefaultBackgroudColor,
              surface: kDefaultBackgroudColor,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: kDefaultBackgroudColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selected != null) {
      setState(() {
        dateSelected = selected;
        isDateSelected = true;
      });
    } else {
      setState(() {
        isDateSelected = false;
      });
    }
  }

  Future<void> sendNewsletter(NewsletterEntity newsletterEntity) async {
    final repo = ref.read(newsletterProvider);
    // Activez le loader ici
    ref.read(loaderStateProvider.notifier).showLoader();

    try {
      await repo.addNewsletter(newsletterEntity);

      // Désactivez le loader après la connexion réussie
      ref.read(loaderStateProvider.notifier).hideLoader();

      // Affichez le message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Newsletter ajoutée avec succès'),
        ),
      );

      Navigator.pop(context);
    } catch (error) {
      // En cas d'erreur, désactivez également le loader
      ref.read(loaderStateProvider.notifier).hideLoader();

      // Affichez le message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
  }

  List<Widget> titleAndTextField({
    required String title,
    required String subtitle,
    required String hintText,
    required TextEditingController controller,
    double? heightOfTextField,
    double? maxLines,
  }) {
    return [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 12,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: heightOfTextField,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: TextFormField(
          onChanged: (String value) {
            if (controller.text.isNotEmpty) {
              if (controller == summaryController) {
                setState(() {
                  summaryIsNotEmpty = true;
                });
              } else if (controller == pdfLinkController) {
                setState(() {
                  pdfLinkIsNotEmpty = true;
                });
              }
            } else {
              if (controller == summaryController) {
                setState(() {
                  summaryIsNotEmpty = false;
                });
              } else if (controller == pdfLinkController) {
                setState(() {
                  pdfLinkIsNotEmpty = false;
                });
              }
            }
          },
          minLines: 1,
          maxLines: maxLines?.toInt() ?? 1,
          controller: controller,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro Rounded',
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Rounded',
          ),
        ),
      ),
    ];
  }
}
