import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstResponseListForm extends ConsumerStatefulWidget {
  const QvstResponseListForm({super.key});

  @override
  ConsumerState<QvstResponseListForm> createState() =>
      _QvstResponseListFormState();
}

class _QvstResponseListFormState extends ConsumerState<QvstResponseListForm> {
  final TextEditingController responseController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final responsesList = ref.watch(qvstAnswerRepoListProvider);
    final repoSelected = ref.watch(qvstAnswerRepoSelectedProvider);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: responsesList.when(
            data: (data) => DropdownButton<QvstAnswerRepoEntity>(
              value: repoSelected,
              onChanged: (QvstAnswerRepoEntity? newValue) {
                ref
                    .watch(qvstAnswerRepoSelectedProvider.notifier)
                    .setAnswerRepo(newValue!);
              },
              items: data
                  .map<DropdownMenuItem<QvstAnswerRepoEntity>>(
                    (QvstAnswerRepoEntity value) =>
                        DropdownMenuItem<QvstAnswerRepoEntity>(
                      value: value,
                      child: Text(value.repoName),
                    ),
                  )
                  .toList(),
            ),
            error: (error, stack) => Text(
              error.toString(),
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            loading: () => const CircularProgressIndicator(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Réponses',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: (repoSelected == null)
              ? const Center(
                  child: Text(
                    'Aucune réponse',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: repoSelected.answers.length,
                  itemBuilder: (context, index) {
                    QvstAnswerEntity answer = repoSelected.answers[index];
                    return ListTile(
                      title: Text(
                        "Réponse: ${answer.answer}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Valeur: ${answer.value}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
