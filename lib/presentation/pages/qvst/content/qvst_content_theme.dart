import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_table_view.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstContentTheme extends ConsumerWidget {
  final String id;
  const QvstContentTheme({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(
      qvstQuestionsByThemesListProvider(id),
    );
    final theme = ref.read(qvstThemesListProvider).asData?.value.firstWhere(
          (element) => element.id == id,
        );
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            'Thème : ${theme?.theme}',
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Expanded(
          child: Center(
            child: questions.when(
              data: (data) => (data.isNotEmpty)
                  ? QvstTableView(
                      themeId: id,
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
