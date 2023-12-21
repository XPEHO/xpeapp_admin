import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/state/qvst_answer_repo_notifier.dart';

void main() {
  test('qvst answer repo notifier ...', () async {
    final notifier = QvstAnswerRepoNotifier();

    final answer = QvstAnswerRepoEntity(
      id: 'answer1',
      repoName: 'repo1',
      answers: [
        QvstAnswerEntity(
          id: 'answer1',
          answer: 'answer1',
          value: 'value',
        ),
      ],
    );

    notifier.setAnswerRepo(
      answer,
    );

    expect(
      notifier.state,
      answer,
    );

    notifier.clearAnswerRepo();

    expect(
      notifier.state,
      null,
    );
  });
}
