import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/response_reference_widget.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstTableView extends ConsumerWidget {
  final String? themeId;
  final List<QvstQuestionEntity> questions;

  const QvstTableView({
    super.key,
    this.themeId,
    required this.questions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: Table(
          border: TableBorder.all(
            color: Colors.black,
            width: 1,
          ),
          children: [
            TableRow(
              children: [
                if (themeId == null)
                  TableCell(
                    child: _getText(
                      'Thème',
                      title: true,
                    ),
                  ),
                TableCell(
                  child: _getText(
                    'Question',
                    title: true,
                  ),
                ),
                TableCell(
                  child: _getText(
                    'Référentiel de réponses',
                    title: true,
                  ),
                ),
                TableCell(
                  child: _getText(
                    'Question posé x fois',
                    title: true,
                  ),
                ),
                TableCell(
                  child: _getText(
                    'Action',
                    title: true,
                  ),
                ),
              ],
            ),
            ...questions.map(
              (question) => TableRow(
                children: [
                  if (themeId == null)
                    TableCell(
                      child: _getText(
                        question.theme ?? 'N/A',
                      ),
                    ),
                  TableCell(
                    child: _getText(
                      question.question,
                    ),
                  ),
                  TableCell(
                    child: ResponseReferenceWidget(
                      qvstId: question.id ?? '',
                      referenceId: question.answerRepoId ?? '',
                    ),
                  ),
                  TableCell(
                    child: _getText(
                      (question.numberAsked ?? 0).toString(),
                    ),
                  ),
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          tooltip: 'Editer',
                          onPressed: () => _showEditDialog(
                            context,
                            question,
                            ref: ref,
                          ),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => _showConfirmDialog(
                            context,
                            question,
                            ref: ref,
                          ),
                          icon: const Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getText(
    String text, {
    bool title = false,
  }) =>
      Padding(
        padding: EdgeInsets.all(
          title ? 10 : 5,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: title ? 16 : 14,
            fontWeight: title ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );

  void _showConfirmDialog(
    BuildContext context,
    QvstQuestionEntity e, {
    WidgetRef? ref,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer la question'),
        content: Text(
          'Êtes-vous sûr de vouloir supprimer la question suivante : \n ${e.question} ?',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => _handleDelete(context, e, ref),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleDelete(
    BuildContext context,
    QvstQuestionEntity e,
    WidgetRef? ref,
  ) async {
    Navigator.pop(context);
    if (ref == null) return;
    ref.read(loaderStateProvider.notifier).showLoader();
    final result = await ref.read(qvstServiceProvider).deleteQvst(e.id ?? '');
    ref.read(loaderStateProvider.notifier).hideLoader();
    if (!context.mounted) return;
    if (result) {
      ref.invalidate(
        (themeId != null)
            ? qvstQuestionsByThemesListProvider(themeId!)
            : qvstQuestionsListProvider,
      );
      if (e.idTheme != null) {
        ref.invalidate(qvstQuestionsByThemesListProvider(e.idTheme!));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erreur lors de la suppression du QVST'),
        ),
      );
    }
  }

  void _showEditDialog(
    BuildContext context,
    QvstQuestionEntity question, {
    WidgetRef? ref,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        bool reversed = question.noLongerUsedBool;
        bool obsolete = question.noLongerUsedBool;
        final textController = TextEditingController(text: question.question);
        bool saving = false;
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text('Modifier la question'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: textController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Intitulé',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                CheckboxListTile(
                  title: const Text('Question inversée'),
                  value: reversed,
                  onChanged: (v) => setState(() => reversed = v ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('Question obsolète'),
                  value: obsolete,
                  onChanged: (v) => setState(() => obsolete = v ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: saving ? null : () => Navigator.pop(context),
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: saving
                    ? null
                    : () async {
                        if (ref == null) return;
                        if (question.id == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('ID de question manquant'),
                            ),
                          );
                          return;
                        }
                        final newText = textController.text.trim();
                        if (newText.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Le libellé ne peut pas être vide'),
                            ),
                          );
                          return;
                        }
                        setState(() => saving = true);
                        try {
                          await ref
                              .read(qvstServiceProvider)
                              .updateQvstQuestion(
                                questionId: question.id!,
                                reversedQuestion: reversed,
                                noLongerUsed: obsolete,
                                questionText: newText,
                              );
                          ref.invalidate(qvstQuestionsListProvider);
                          if (themeId != null) {
                            ref.invalidate(
                                qvstQuestionsByThemesListProvider(themeId!));
                          }
                          if (question.idTheme != null) {
                            ref.invalidate(qvstQuestionsByThemesListProvider(
                                question.idTheme!));
                          }
                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Question mise à jour'),
                              ),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Erreur: ${e.toString()}'),
                              ),
                            );
                          }
                        } finally {
                          if (context.mounted) {
                            setState(() => saving = false);
                          }
                        }
                      },
                child: saving
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Enregistrer'),
              ),
            ],
          ),
        );
      },
    );
  }
}
