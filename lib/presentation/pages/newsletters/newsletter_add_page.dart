// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';
import 'package:xpeapp_admin/presentation/pages/template/scaffold_template.dart';
import 'package:xpeapp_admin/presentation/widgets/app_loader.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

enum NewsletterTypePage {
  add,
  edit,
}

class NewsletterAddOrEditPage extends ConsumerStatefulWidget {
  final NewsletterTypePage typePage;
  final NewsletterEntity? newsletter;

  const NewsletterAddOrEditPage({
    super.key,
    required this.typePage,
    this.newsletter,
  });

  @override
  ConsumerState<NewsletterAddOrEditPage> createState() =>
      _NewsletterAddOrEditPageState();
}

class _NewsletterAddOrEditPageState
    extends ConsumerState<NewsletterAddOrEditPage> {
  DateTime? dateSelected;
  bool isDateSelected = false;
  bool summaryIsNotEmpty = false;
  bool pdfLinkIsNotEmpty = false;
  String? imageName;
  PlatformFile? file;

  final TextEditingController summaryController = TextEditingController();
  final TextEditingController pdfLinkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.typePage == NewsletterTypePage.edit) {
      setState(() {
        dateSelected = widget.newsletter!.date.toDate();
        isDateSelected = true;
        summaryController.text =
            widget.newsletter!.summary.replaceAll(',', '\n');
        summaryIsNotEmpty = true;
        pdfLinkController.text = widget.newsletter!.pdfUrl;
        pdfLinkIsNotEmpty = true;
        imageName = widget.newsletter!.picture;
      });
    }
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        file = result.files.first;
        imageName = file!.name;
      });
    }
  }

  // In order to avoid wrong type of file being uploaded
  MediaType getMediaType(PlatformFile file) {
    final ext = file.extension?.toLowerCase();
    if (ext == 'png') return MediaType('image', 'png');
    if (ext == 'jpg' || ext == 'jpeg') return MediaType('image', 'jpeg');
    return MediaType('application', 'octet-stream');
  }

  // This function upload the image to our storage WordPress and return the path of the image in firestore
  // The image will be stored in the folder "newsletters" with the name of the file
  Future<String?> uploadImage(String imageName) async {
    if (file != null && file!.bytes != null) {
      final storageService = ref.read(storageServiceProvider);
      final imagePath = 'newsletters/$imageName.${file!.extension}';
      final mediaType = getMediaType(file!);
      try {
        final result = await storageService.uploadImageMultipart(
          bytes: file!.bytes!,
          filename: '$imageName.${file!.extension}',
          folder: 'newsletters',
          contentType: mediaType,
        );
        if (result.isNotEmpty) {
          return imagePath;
        } else {
          return null;
        }
      } catch (e) {
        debugPrint('Image upload failed: $e');
        return null;
      }
    }
    debugPrint('No image selected');
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return ScaffoldTemplate(
      appBarTitle:
          '${(widget.typePage == NewsletterTypePage.add) ? 'Ajouter' : 'Modifier'} une newsletter',
      appBarLeading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (!isDateSelected)
                SizedBox(
                  width: width,
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
              ...titleAndButton(
                title: 'Ajouter une image de prévisualisation',
                subtitle: 'Choisissez une image pour la prévisualisation',
                buttonText: 'Ajouter une image',
                onPressed: () async {
                  pickImage();
                },
                imageName: imageName,
                onDelete: () {
                  setState(() {
                    imageName = null;
                  });
                },
              ),
              const SizedBox(height: 15),
              ...titleAndTextField(
                title: 'Saisir le sommaire',
                subtitle: '1 ligne = 1 chapitre',
                hintText: 'Actualités\nSport\nCulture\n...',
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
              /* TODO: Activate this function when the backend is ready to handle a publication date different of the upload date, so the notification will be sent at the publication date
              const SizedBox(height: 20),
              SizedBox(
                width: width,
                child: const ListTile(
                  title: Text(
                    'Choisir la date de publication',
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
              const SizedBox(height: 20),
              SizedBox(
                width: width,
                child: const NewsletterPublicationDateWidget(),
              ), */
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: (ref.watch(loaderStateProvider))
                    ? const AppLoader(
                        color: kDefaultXpehoColor,
                        size: 60,
                      )
                    : Button.secondary(
                        text:
                            '${(widget.typePage == NewsletterTypePage.add) ? 'Ajouter' : 'Modifier'} la newsletter',
                        onPressed: (isDateSelected &&
                                summaryIsNotEmpty &&
                                pdfLinkIsNotEmpty)
                            ? () async {
                                Timestamp? time = await _getPublicationDate();
                                if (time != null) {
                                  String summary =
                                      summaryController.text.replaceAll(
                                    '\n',
                                    ',',
                                  );
                                  String? previewImagePath = await uploadImage(
                                      DateFormat('yyyy-MM-dd')
                                          .format(dateSelected!));
                                  NewsletterEntity newsletterEntity =
                                      NewsletterEntity(
                                    summary: summary,
                                    date: Timestamp.fromDate(dateSelected!),
                                    pdfUrl: pdfLinkController.text,
                                    picture: previewImagePath ?? '',
                                    publicationDate: time,
                                  );
                                  if (widget.typePage ==
                                      NewsletterTypePage.add) {
                                    await sendNewsletter(newsletterEntity);
                                  } else {
                                    newsletterEntity =
                                        newsletterEntity.copyWith(
                                            id: widget.newsletter?.id,
                                            picture: previewImagePath);
                                    await updateNewsletter(newsletterEntity);
                                  }
                                  // Redirect to the previous page
                                  Navigator.pop(context);
                                }
                              }
                            : null,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showDatePickerForNewsletter(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2035),
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
    final width = MediaQuery.of(context).size.width * 0.8;
    return [
      SizedBox(
        width: width,
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
        width: width,
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

  Future<void> updateNewsletter(NewsletterEntity newsletterEntity) async {
    final repo = ref.read(newsletterProvider);
    // Activez le loader ici
    ref.read(loaderStateProvider.notifier).showLoader();

    try {
      await repo.updateNewsletter(newsletterEntity);

      // Désactivez le loader après la connexion réussie
      ref.read(loaderStateProvider.notifier).hideLoader();

      // Affichez le message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Newsletter modifié avec succès'),
        ),
      );
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

  Future<Timestamp?> _getPublicationDate() async {
    final read = ref.read(newsletterPublicationProvider);
    if (read.moment == NewsletterPublicationMoment.now) {
      return Timestamp.now();
    } else {
      final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2035),
        helpText: MediaQuery.of(context).size.width < 600
            ? 'Choisir la date de publication'
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
        return Timestamp.fromDate(selected);
      } else {
        return null;
      }
    }
  }

  List<Widget> titleAndButton({
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed,
    String? imageName,
    VoidCallback? onDelete,
  }) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return [
      SizedBox(
        width: width,
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
        width: width,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            imageName == null
                ? TextButton.icon(
                    onPressed: onPressed,
                    icon: const Icon(Icons.image),
                    label: Text(buttonText),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF Pro Rounded',
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          imageName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: onDelete,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    ];
  }
}
