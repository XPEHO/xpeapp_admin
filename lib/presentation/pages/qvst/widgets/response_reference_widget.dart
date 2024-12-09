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
  QvstAnswerRepoEntity? _selectedRepo;
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    final selectedRepoData = ref.watch(qvstAnswerRepoListProvider);
    final initialRepo = selectedRepoData.maybeWhen(
      data: (data) => data.firstWhere(
        (repo) => repo.id == widget.referenceId,
      ),
      orElse: () => null,
    );

    return selectedRepoData.when(
      data: (data) {
        _selectedRepo ??= initialRepo;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<QvstAnswerRepoEntity>(
                value: _selectedRepo,
                onChanged: (QvstAnswerRepoEntity? newValue) {
                  setState(() {
                    _selectedRepo = newValue;
                    _isSaved = newValue == initialRepo;
                  });
                  if (newValue != null) {
                    ref
                        .watch(qvstAnswerRepoSelectedProvider.notifier)
                        .setAnswerRepo(newValue);
                  }
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
            IconButton(
              onPressed: () {
                if (_selectedRepo != null) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: kDefaultXpehoColor,
                      title: Text(
                        _selectedRepo?.repoName ?? '',
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
                          itemCount: _selectedRepo?.answers.length ?? 0,
                          itemBuilder: (context, index) {
                            QvstAnswerEntity answerEntity =
                                _selectedRepo!.answers[index];
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
            if (!_isSaved && _selectedRepo != null)
              IconButton(
                onPressed: () async {
                  try {
                    await ref.read(qvstServiceProvider).updateQvst(
                      widget.qvstId,
                      {'answer_repo_id': _selectedRepo?.id},
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
}
