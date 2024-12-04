import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_table_view.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_import_question_file_dialog.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

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
    final theme = (widget.id != null)
        ? ref.read(qvstThemesListProvider).asData?.value.firstWhere(
              (element) => element.id == widget.id!,
            )
        : null;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 300,
                margin: const EdgeInsets.only(
                  top: 50,
                  left: 50,
                ),
                child: Button(
                  text: '+ Ajouter une question',
                  onPressed: () {
                    ref.watch(qvstNotifierProvider.notifier).setTheme(theme);
                    Navigator.pushNamed(
                      context,
                      '/qvst/add',
                    );
                  },
                  color: kDefaultXpehoColor,
                ),
              ),
            ),
            if (widget.id == null)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 300,
                  margin: const EdgeInsets.only(
                    top: 50,
                    right: 50,
                  ),
                  child: Button(
                    text: 'Importer des questions',
                    onPressed: () => showImportQuestionByCsvFileDialog(
                      context,
                      ref,
                    ),
                    color: kDefaultXpehoColor,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            (widget.id != null) ? 'Thème : ${theme?.name}' : 'Tous les thèmes',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
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
                onChanged: (value) {
                  ref.read(qvstMenuProvider.notifier).changeMenu(
                        QvstMenu.theme,
                        id: value,
                      );
                },
                items: ref
                    .watch(qvstThemesListProvider)
                    .asData
                    ?.value
                    .map(
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
        Expanded(
          child: Center(
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
        ),
      ],
    );
  }
}
