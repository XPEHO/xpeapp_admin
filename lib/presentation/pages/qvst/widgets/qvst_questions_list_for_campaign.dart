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
  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(qvstQuestionsListProvider);
    final questionsSelected = ref.watch(qvstQuestionsForCampaignProvider);
    return questions.when(
      data: (data) {
        Map<String, List<QvstQuestionEntity>> questionsByCategory = {};
        for (var element in data) {
          if (questionsByCategory.containsKey(element.theme)) {
            questionsByCategory[element.theme]!.add(element);
          } else {
            questionsByCategory[element.theme] = [element];
          }
        }
        return Expanded(
          child: ListView.builder(
            itemCount: questionsByCategory.length,
            itemBuilder: (context, index) {
              final category = questionsByCategory.keys.elementAt(index);
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
                      itemCount: questionsByCategory[category]!.length,
                      itemBuilder: (context, index) {
                        final question = questionsByCategory[category]![index];
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
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Text(
        error.toString(),
      ),
    );
  }
}
