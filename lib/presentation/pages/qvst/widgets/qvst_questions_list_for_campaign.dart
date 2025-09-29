import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstQuestionsListForCampaign extends ConsumerStatefulWidget {
  const QvstQuestionsListForCampaign({super.key});

  @override
  ConsumerState<QvstQuestionsListForCampaign> createState() =>
      _QvstQuestionsListForCampaignState();
}

class _QvstQuestionsListForCampaignState
    extends ConsumerState<QvstQuestionsListForCampaign> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themesSelected = ref.watch(qvstThemesSelectionProvider);
    final questionsSelected = ref.watch(qvstQuestionsForCampaignProvider);

    // Si aucun thème sélectionné, afficher un message
    if (themesSelected.isEmpty) {
      return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Text(
          'Veuillez d\'abord sélectionner au moins un thème pour voir les questions disponibles.',
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: themesSelected.length,
      itemBuilder: (context, themeIndex) {
        final theme = themesSelected[themeIndex];

        final questionsForThemeAsync =
            ref.watch(qvstQuestionsByThemesListProvider(theme.id));

        return questionsForThemeAsync.when(
          data: (questionsForTheme) {
            Map<String, List<QvstQuestionEntity>> questionsByCategory = {};
            for (var question in questionsForTheme) {
              final themeKey = question.theme ?? 'Autre';
              if (questionsByCategory.containsKey(themeKey)) {
                questionsByCategory[themeKey]!.add(question);
              } else {
                questionsByCategory[themeKey] = [question];
              }
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questionsByCategory.length,
              itemBuilder: (context, categoryIndex) {
                final category =
                    questionsByCategory.keys.elementAt(categoryIndex);
                final questionsInCategory = questionsByCategory[category]!;

                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: questionsInCategory.length,
                        itemBuilder: (context, questionIndex) {
                          final question = questionsInCategory[questionIndex];
                          return CheckboxListTile(
                            title: Text(
                              question.question,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            value: questionsSelected.contains(question),
                            onChanged: (value) {
                              ref
                                  .read(
                                      qvstQuestionsForCampaignProvider.notifier)
                                  .toggleQuestion(question);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Text(error.toString()),
        );
      },
    );
  }
}
