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

  @override
  Widget build(BuildContext context) {
    final responsesList = ref.watch(qvstAnswerRepoListProvider);
    return responsesList.when(
      data: (data) {
        QvstAnswerRepoEntity repo = data.firstWhere(
          (element) => element.id == widget.referenceId,
        );
        return SizedBox(
          width: 200,
          child: Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<QvstAnswerRepoEntity>(
                  value: _selectedRepo ?? repo,
                  onChanged: (QvstAnswerRepoEntity? newValue) {
                    setState(() {
                      if (repo == newValue) {
                        _selectedRepo = null;
                      } else {
                        _selectedRepo = newValue;
                      }
                    });
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
              IconButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: kDefaultXpehoColor,
                    title: Text(
                      (_selectedRepo ?? repo).repoName,
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
                        itemCount: (_selectedRepo ?? repo).answers.length,
                        itemBuilder: (context, index) {
                          QvstAnswerEntity answerEntity =
                              (_selectedRepo ?? repo).answers[index];
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
                ),
                icon: const Icon(
                  Icons.info,
                  color: Colors.black,
                ),
              ),
              if (_selectedRepo != null)
                IconButton(
                  onPressed: () => ref.read(qvstServiceProvider).updateQvst(
                    widget.qvstId,
                    {
                      'answer_repo_id': _selectedRepo!.id,
                    },
                  ),
                  icon: const Icon(
                    Icons.save,
                    color: Colors.black,
                  ),
                ),
            ],
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
