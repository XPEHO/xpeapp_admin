import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/state/qvst_answer_repo_notifier.dart';

void main() {
  test('qvst answer repo notifier ...', () async {
    final notifier = QvstAnswerRepoNotifier();

    notifier.setAnswerRepo(
      QvstAnswerRepoEntity(
        id: 'id',
        repoName: 'repoName',
        answers: [
          QvstAnswerEntity(
            id: 'id',
            answer: 'answer',
            value: 'value',
          ),
        ],
      ),
    );

    expect(notifier.state, isNotNull);

    notifier.clearAnswerRepo();

    expect(notifier.state, isNull);

    notifier.setAnswerRepo(
      null,
    );

    expect(notifier.state, isNull);
  });
}
