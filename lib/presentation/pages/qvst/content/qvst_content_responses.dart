import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_update_response_repo.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstContentResponses extends ConsumerWidget {
  const QvstContentResponses({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsesRepo = ref.watch(qvstAnswerRepoListProvider);
    return responsesRepo.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Référentiels de réponses'),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              subtitleWidget(
                'Modifiez les référentiels de réponses utilisables pour les campagnes QVST',
              ),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(
                      data.length,
                      (index) {
                        QvstAnswerRepoEntity qvstAnswerRepoEntity = data[index];
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          constraints: const BoxConstraints(
                            maxWidth: 400,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Card(
                            color: Colors.white,
                            elevation: 0,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  qvstAnswerRepoEntity.repoName,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Table(
                                  border: TableBorder.all(
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TableRow(
                                      children: [
                                        TableCell(
                                          child: Center(
                                            child: _getTextWidget(
                                              'Réponse',
                                              bold: true,
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          child: Center(
                                            child: _getTextWidget(
                                              'Valeur',
                                              bold: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ...qvstAnswerRepoEntity.answers.map(
                                      (e) {
                                        return TableRow(
                                          children: [
                                            TableCell(
                                              child: Center(
                                                child: _getTextWidget(
                                                  e.answer,
                                                ),
                                              ),
                                            ),
                                            TableCell(
                                              child: Center(
                                                child: _getTextWidget(
                                                  e.value,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 60,
                                  child: Button(
                                    text: 'Modifier',
                                    color: kDefaultXpehoColor,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return QvstContentUpdateResponseRepo(
                                            qvstAnswerRepoEntity:
                                                qvstAnswerRepoEntity,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text(error.toString()),
      ),
    );
  }

  Widget _getTextWidget(
    String text, {
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
