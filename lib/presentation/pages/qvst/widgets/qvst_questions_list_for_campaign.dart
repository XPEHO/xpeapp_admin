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
  final Map<String, bool> _expandedThemes = {};

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

            return Column(
              children: questionsByCategory.entries.map((entry) {
                final category = entry.key;
                final questionsInCategory = entry.value;
                final themeId = '${theme.id}_$category';
                final isExpanded = _expandedThemes[themeId] ?? false;

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _expandedThemes[themeId] = !isExpanded;
                          });
                        },
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10)),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  category,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                isExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isExpanded) ...[
                        const Divider(height: 1),
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
                                  fontSize: 16,
                                ),
                              ),
                              value: questionsSelected.contains(question),
                              onChanged: (value) {
                                ref
                                    .read(qvstQuestionsForCampaignProvider
                                        .notifier)
                                    .toggleQuestion(question);
                              },
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                );
              }).toList(),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Text(error.toString()),
        );
      },
    );
  }
}
