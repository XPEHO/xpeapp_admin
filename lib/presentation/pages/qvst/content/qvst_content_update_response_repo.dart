import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstContentUpdateResponseRepo extends ConsumerStatefulWidget {
  final QvstAnswerRepoEntity qvstAnswerRepoEntity;

  const QvstContentUpdateResponseRepo({
    super.key,
    required this.qvstAnswerRepoEntity,
  });

  @override
  ConsumerState<QvstContentUpdateResponseRepo> createState() =>
      _QvstContentUpdateResponseRepoState();
}

class _QvstContentUpdateResponseRepoState
    extends ConsumerState<QvstContentUpdateResponseRepo> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _formData = {};

  @override
  void initState() {
    super.initState();
    _formData['id'] = widget.qvstAnswerRepoEntity.id;
    _formData['repoName'] = widget.qvstAnswerRepoEntity.repoName;
    _formData['answers'] = widget.qvstAnswerRepoEntity.answers
        .map(
          (e) => e.toJson(),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Référentiel des réponses',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.5,
              child: _getEditableTextWidget(
                widget.qvstAnswerRepoEntity.repoName,
                onSaved: (value) {
                  _formData['repoName'] = value;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      _getTextWidget(
                        'Réponse',
                        bold: true,
                      ),
                      _getTextWidget(
                        'Valeur',
                        bold: true,
                      ),
                    ],
                  ),
                  for (var i = 0;
                      i < widget.qvstAnswerRepoEntity.answers.length;
                      i++)
                    TableRow(
                      children: [
                        _getEditableTextWidget(
                          widget.qvstAnswerRepoEntity.answers[i].answer,
                          onSaved: (value) {
                            Map<String, dynamic> answer =
                                _formData['answers'][i];
                            answer['answer'] = value;
                          },
                        ),
                        _getEditableTextWidget(
                          widget.qvstAnswerRepoEntity.answers[i].value
                              .toString(),
                          onSaved: (value) {
                            Map<String, dynamic> answer =
                                _formData['answers'][i];
                            answer['value'] = value;
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 200,
                  child: Button.secondary(
                    onPressed: () => context.pop(),
                    text: 'Annuler',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 200,
                  child: Button(
                    onPressed: () async {
                      // Ajoutez ici la logique pour enregistrer les modifications
                      bool isValidate = _formKey.currentState!.validate();
                      if (isValidate) {
                        debugPrint('Form is valid');
                        QvstAnswerRepoEntity newQvstAnswerRepoEntity =
                            QvstAnswerRepoEntity(
                          id: widget.qvstAnswerRepoEntity.id,
                          repoName: _formData['repoName'] ??
                              widget.qvstAnswerRepoEntity.repoName,
                          answers: _formData['answers']
                              .map<QvstAnswerEntity>(
                                (e) => QvstAnswerEntity.fromJson(
                                  jsonDecode(
                                    jsonEncode(e),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                        final response = await ref
                            .read(qvstServiceProvider)
                            .updateQvstAnswersRepo(
                              newQvstAnswerRepoEntity,
                            );
                        if (response) {
                          ref.invalidate(qvstAnswerRepoListProvider);
                          if (!context.mounted) return;
                          context.pop();
                        } else {
                          debugPrint('Error');
                        }
                      }
                    },
                    color: kDefaultXpehoColor,
                    text: 'Enregistrer',
                  ),
                ),
              ],
            ),
          ],
        ),
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

  Widget _getEditableTextWidget(
    String text, {
    required void Function(String?) onSaved,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: onSaved,
        onChanged: (value) => onSaved(value),
        initialValue: text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        // Ajoutez ici la logique pour gérer la modification du texte
      ),
    );
  }
}
