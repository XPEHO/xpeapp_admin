import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';

class QvstContentPage extends ConsumerWidget {
  final List<QvstQuestionEntity> questions;

  const QvstContentPage({
    super.key,
    required this.questions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Liste des questions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              QvstQuestionEntity question = questions[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: ListTile(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/qvst/detail',
                      arguments: {
                        'id': question.id,
                      },
                    ),
                    title: Text(
                      question.question.cleanText(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
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
