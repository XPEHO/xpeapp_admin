import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/state/response_reference_selection_notifier.dart';

void main() {
  group('ResponseReferenceSelectionNotifier tests', () {
    test('initial state is null', () {
      final notifier = ResponseReferenceSelectionNotifier(null);

      expect(notifier.state, isNull);
    });

    test('select method updates the state', () {
      final notifier = ResponseReferenceSelectionNotifier(null);

      final qvstAnswerRepoEntity = QvstAnswerRepoEntity(
        id: '1',
        repoName: 'Test Repo',
        answers: [],
      );

      notifier.select(qvstAnswerRepoEntity);

      expect(notifier.state, qvstAnswerRepoEntity);
    });

    test('select method can set state to null', () {
      final qvstAnswerRepoEntity = QvstAnswerRepoEntity(
        id: '1',
        repoName: 'Test Repo',
        answers: [],
      );
      final notifier = ResponseReferenceSelectionNotifier(qvstAnswerRepoEntity);

      notifier.select(null);

      expect(notifier.state, isNull);
    });
  });
}
