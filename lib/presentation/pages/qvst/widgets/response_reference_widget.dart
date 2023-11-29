import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/providers.dart';

class ResponseReferenceWidget extends ConsumerWidget {
  final String referenceId;
  const ResponseReferenceWidget({
    super.key,
    required this.referenceId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsesList = ref.watch(qvstAnswerRepoListProvider);
    return responsesList.when(
      data: (data) {
        QvstAnswerRepoEntity repo = data.firstWhere(
          (element) => element.id == referenceId,
        );
        return SizedBox(
          width: 200,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<QvstAnswerRepoEntity>(
              value: repo,
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
          ),
        );
      },
      error: (error, stack) => Text(
        error.toString(),
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
