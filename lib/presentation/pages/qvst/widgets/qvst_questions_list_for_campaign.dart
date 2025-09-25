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

    // Récupérer toutes les questions pour tous les thèmes sélectionnés
    final allQuestionsAsync = Future.wait(
      themesSelected
          .map((theme) =>
              ref.read(qvstQuestionsByThemesListProvider(theme.id).future))
          .toList(),
    );

    return FutureBuilder<List<List<QvstQuestionEntity>>>(
      future: allQuestionsAsync,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return const Text('Aucune question disponible');
        }

        // Affichage par thème sélectionné avec séparation visuelle
        return ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          itemCount: themesSelected.length,
          itemBuilder: (context, themeIndex) {
            final theme = themesSelected[themeIndex];
            final questionsForTheme = snapshot.data![themeIndex];

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
                      theme.name, // Nom du thème sélectionné
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
                    itemCount: questionsForTheme.length,
                    itemBuilder: (context, questionIndex) {
                      final question = questionsForTheme[questionIndex];
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
                              .read(qvstQuestionsForCampaignProvider.notifier)
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
    );
  }
}
