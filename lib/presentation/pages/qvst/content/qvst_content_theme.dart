import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_table_view.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_import_question_file_dialog.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstContentTheme extends ConsumerStatefulWidget {
  final String? id;
  const QvstContentTheme({super.key, required this.id});

  @override
  ConsumerState<QvstContentTheme> createState() => _QvstContentThemeState();
}

class _QvstContentThemeState extends ConsumerState<QvstContentTheme> {
  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(
      (widget.id != null)
          ? qvstQuestionsByThemesListProvider(widget.id!)
          : qvstQuestionsListProvider,
    );
    final themeList = ref.watch(qvstThemesListProvider).asData?.value;
    final theme = (widget.id != null)
        ? themeList?.firstWhere(
            (element) => element.id == widget.id!,
          )
        : null;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Questions par thème'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitleWidget(
            'Créez, importez ou modifiez les questions utilisables pour les campagnes QVST',
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Add dropdown to select theme
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Thème : ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: widget.id,
                          hint: const Text('Sélectionnez un thème'),
                          onChanged: (value) {
                            ref.read(qvstMenuProvider.notifier).changeMenu(
                                  QvstMenu.theme,
                                  id: value,
                                );
                          },
                          items: themeList
                              ?.map(
                                (e) => DropdownMenuItem<String>(
                                  value: e.id,
                                  child: Text(e.name),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      // Icon to suppr theme (only if theme selected)
                      if (widget.id != null)
                        Tooltip(
                          message: 'Supprimer le filtre',
                          child: IconButton(
                            onPressed: () {
                              ref.read(qvstMenuProvider.notifier).changeMenu(
                                    QvstMenu.theme,
                                  );
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: questions.when(
                      data: (data) => (data.isNotEmpty)
                          ? QvstTableView(
                              themeId: widget.id,
                              questions: data,
                            )
                          : const Text(
                              'Aucune question pour ce thème',
                            ),
                      error: (error, stackTrace) => Text(
                        error.toString(),
                      ),
                      loading: () => const CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Tooltip(
            message: "Recharger les thèmes et questions",
            child: FloatingActionButton(
              onPressed: () {
                ref.invalidate(qvstThemesListProvider);
                ref.invalidate(
                  qvstQuestionsByThemesListProvider(theme?.id ?? ''),
                );
                ref.invalidate(qvstQuestionsListProvider);
              },
              backgroundColor: kDefaultXpehoColor,
              child: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Tooltip(
            message: "Ajouter une question",
            child: FloatingActionButton(
              onPressed: () {
                ref.watch(qvstThemesSelectionProvider.notifier).setTheme(theme);
                Navigator.pushNamed(
                  context,
                  '/qvst/add',
                );
              },
              backgroundColor: kDefaultXpehoColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Tooltip(
            message: "Importer un fichier de questions",
            child: FloatingActionButton(
              onPressed: () {
                showImportQuestionByCsvFileDialog(
                  context,
                  ref,
                );
              },
              backgroundColor: kDefaultXpehoColor,
              child: const Icon(
                Icons.upload_file,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
