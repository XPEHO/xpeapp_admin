import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstImportQuestionFileDialog extends ConsumerStatefulWidget {
  const QvstImportQuestionFileDialog({super.key});

  @override
  QvstImportQuestionFileDialogState createState() =>
      QvstImportQuestionFileDialogState();
}

class QvstImportQuestionFileDialogState
    extends ConsumerState<QvstImportQuestionFileDialog> {
  FilePickerResult? csvFileToImport;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kDefaultXpehoColor,
      title: const Text(
        'Importer des questions',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Veuillez choisir le fichier CSV dans le champ ci-dessous',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Button.secondary(
            text: 'Choisir un fichier',
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();

              if (result != null) {
                setState(() {
                  csvFileToImport = result;
                });
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          if (csvFileToImport != null)
            Text(
              csvFileToImport!.files.first.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: const Text(
            'Annuler',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
          onPressed: (csvFileToImport != null)
              ? () async {
                  try {
                    final qvstService = ref.read(qvstServiceProvider);
                    await qvstService
                        .importCsv(csvFileToImport!.files.first.bytes!);
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fichier importé !'),
                      ),
                    );
                    context.pop();
                    ref.invalidate(qvstQuestionsListProvider);
                    ref.invalidate(qvstQuestionsByThemesListProvider);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                    context.pop();
                  }
                }
              : null,
          child: const Text(
            'Importer',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

Future showImportQuestionByCsvFileDialog(
    BuildContext context, WidgetRef ref) async {
  showDialog(
    context: context,
    builder: (context) => const QvstImportQuestionFileDialog(),
  );
}
