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
                    child: IconButton(
                      onPressed: () => _showConfirmDialog(
                        context,
                        question,
                        ref: ref,
                      ),
                      icon: const Icon(
                        Icons.delete,
                      ),
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

  _showConfirmDialog(
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
            onPressed: () async {
              Navigator.pop(context);
              if (ref != null) {
                ref.read(loaderStateProvider.notifier).showLoader();
                bool result =
                    await ref.read(qvstServiceProvider).deleteQvst(e.id ?? '');
                if (result) {
                  ref.invalidate(
                    (themeId != null)
                        ? qvstQuestionsByThemesListProvider(
                            themeId!,
                          )
                        : qvstQuestionsListProvider,
                  );
                  ref.read(loaderStateProvider.notifier).hideLoader();
                  if (!context.mounted) return;
                } else {
                  ref.read(loaderStateProvider.notifier).hideLoader();
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Erreur lors de la suppression du QVST'),
                    ),
                  );
                }
              }
            },
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
}
