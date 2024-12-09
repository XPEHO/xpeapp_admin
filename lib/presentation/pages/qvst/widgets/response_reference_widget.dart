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
  QvstAnswerRepoEntity? _initialRepo;
  bool _isSaved = true;

  void _initializeRepo(List<QvstAnswerRepoEntity> data) {
    if (_initialRepo == null) {
      _initialRepo =
          data.firstWhere((element) => element.id == widget.referenceId);
      _selectedRepo = _initialRepo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsesList = ref.watch(qvstAnswerRepoListProvider);

    return responsesList.when(
      data: (data) {
        _initializeRepo(data);

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<QvstAnswerRepoEntity>(
                value: _selectedRepo,
                onChanged: (QvstAnswerRepoEntity? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedRepo = newValue;
                      _isSaved = newValue == _initialRepo;
                    });
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
              onPressed: _selectedRepo != null
                  ? () => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: kDefaultXpehoColor,
                          title: Text(
                            _selectedRepo!.repoName,
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
                              itemCount: _selectedRepo!.answers.length,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      )
                  : null,
              icon: const Icon(
                Icons.info,
                color: Colors.black,
              ),
            ),
            if (!_isSaved)
              IconButton(
                onPressed: _selectedRepo != null
                    ? () async {
                        try {
                          await ref.read(qvstServiceProvider).updateQvst(
                            widget.qvstId,
                            {'answer_repo_id': _selectedRepo!.id},
                          );
                          setState(() {
                            _initialRepo = _selectedRepo;
                            _isSaved = true;
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Erreur : ${e.toString()}'),
                            ),
                          );
                        }
                      }
                    : null,
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
