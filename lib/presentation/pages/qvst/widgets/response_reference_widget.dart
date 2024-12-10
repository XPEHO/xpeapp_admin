// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/providers.dart';

class ResponseReferenceWidget extends ConsumerStatefulWidget {
  final String qvstId;
  final String referenceId;

  const ResponseReferenceWidget({
    super.key,
    required this.qvstId,
    required this.referenceId,
  });

  @override
  ConsumerState<ResponseReferenceWidget> createState() =>
      _ResponseReferenceWidgetState();
}

class _ResponseReferenceWidgetState
    extends ConsumerState<ResponseReferenceWidget> {
  bool _isSaved = true;

  @override
  Widget build(BuildContext context) {
    final qvstAnswerSets = ref.watch(qvstAnswerRepoListProvider);
    final responseReferenceSelection =
        ref.watch(responseReferenceSelectionProvider(widget.referenceId));

    return qvstAnswerSets.when(
      data: (data) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<QvstAnswerRepoEntity>(
                value: responseReferenceSelection,
                onChanged: (QvstAnswerRepoEntity? newValue) =>
                    _onChanged(newValue, responseReferenceSelection),
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
            IconButton(
              onPressed: () {
                if (responseReferenceSelection != null) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: kDefaultXpehoColor,
                      title: Text(
                        responseReferenceSelection.repoName,
                        style: const TextStyle(color: Colors.white),
                      ),
                      content: Container(
                        width: 300,
                        height: 300,
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: ListView.builder(
                          itemCount: responseReferenceSelection.answers.length,
                          itemBuilder: (context, index) {
                            QvstAnswerEntity answerEntity =
                                responseReferenceSelection.answers[index];
                            return ListTile(
                              title: Text(
                                "${answerEntity.answer} (${answerEntity.value})",
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Fermer',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.info,
                color: Colors.black,
              ),
            ),
            if (!_isSaved && responseReferenceSelection != null)
              IconButton(
                onPressed: () async {
                  try {
                    await ref.read(qvstServiceProvider).updateQvst(
                      widget.qvstId,
                      {'answer_repo_id': responseReferenceSelection.id},
                    );
                    setState(() {
                      _isSaved = true;
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Erreur : ${e.toString()}'),
                      ),
                    );
                  }
                },
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,
                ),
              ),
          ],
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

  ///
  /// Update the selected response reference
  ///
  void _onChanged(QvstAnswerRepoEntity? newValue,
      QvstAnswerRepoEntity? responseReferenceSelection) {
    setState(() {
      final didChanged = newValue != responseReferenceSelection;
      ref
          .read(responseReferenceSelectionProvider(widget.referenceId).notifier)
          .select(newValue);
      _isSaved = !didChanged;
    });
    if (newValue != null) {
      ref
          .watch(qvstAnswerRepoSelectedProvider.notifier)
          .setAnswerRepo(newValue);
    }
  }
}
