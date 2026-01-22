import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class QvstContentAddResponseRepo extends ConsumerStatefulWidget {
  const QvstContentAddResponseRepo({super.key});

  @override
  ConsumerState<QvstContentAddResponseRepo> createState() =>
      _QvstContentAddResponseRepoState();
}

class _QvstContentAddResponseRepoState
    extends ConsumerState<QvstContentAddResponseRepo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _repoNameController = TextEditingController();
  final List<Map<String, TextEditingController>> _answersControllers = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Ajouter 5 réponses par défaut
    for (int i = 0; i < 5; i++) {
      _addAnswerRow();
    }
  }

  void _addAnswerRow() {
    setState(() {
      _answersControllers.add({
        'answer': TextEditingController(),
        'value':
            TextEditingController(text: '${5 - _answersControllers.length}'),
      });
    });
  }

  void _removeAnswerRow(int index) {
    if (_answersControllers.length > 1) {
      setState(() {
        _answersControllers[index]['answer']?.dispose();
        _answersControllers[index]['value']?.dispose();
        _answersControllers.removeAt(index);
      });
    }
  }

  @override
  void dispose() {
    _repoNameController.dispose();
    for (var controllers in _answersControllers) {
      controllers['answer']?.dispose();
      controllers['value']?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Nouveau référentiel de réponses',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    controller: _repoNameController,
                    decoration: const InputDecoration(
                      labelText: 'Nom du référentiel',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un nom';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: _getTextWidget('Réponse', bold: true),
                          ),
                          Expanded(
                            flex: 1,
                            child: _getTextWidget('Valeur', bold: true),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                      const Divider(),
                      ...List.generate(_answersControllers.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  controller: _answersControllers[index]
                                      ['answer'],
                                  decoration: const InputDecoration(
                                    hintText: 'Réponse',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Requis';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  controller: _answersControllers[index]
                                      ['value'],
                                  decoration: const InputDecoration(
                                    hintText: 'Valeur',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Requis';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: _answersControllers.length > 1
                                    ? () => _removeAnswerRow(index)
                                    : null,
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 10),
                      TextButton.icon(
                        onPressed: _addAnswerRow,
                        icon: const Icon(Icons.add),
                        label: const Text('Ajouter une réponse'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Button.secondary(
                        onPressed: () => Navigator.pop(context),
                        text: 'Annuler',
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 200,
                      child: Button(
                        onPressed: _isLoading ? null : _handleSubmit,
                        color: kDefaultXpehoColor,
                        text: _isLoading ? 'Création...' : 'Créer',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final answers = _answersControllers.map((controllers) {
        return QvstAnswerEntity(
          id: '',
          answer: controllers['answer']!.text,
          value: controllers['value']!.text,
        );
      }).toList();

      final newRepo = QvstAnswerRepoEntity(
        id: '',
        repoName: _repoNameController.text,
        answers: answers,
      );

      final success =
          await ref.read(qvstServiceProvider).addQvstAnswersRepo(newRepo);

      if (success) {
        ref.invalidate(qvstAnswerRepoListProvider);
        if (mounted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Référentiel créé avec succès'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _getTextWidget(String text, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
