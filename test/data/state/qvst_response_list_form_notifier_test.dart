import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/data/state/qvst_response_list_form_notifier.dart';

void main() {
  test('qvst response list form notifier ...', () async {
    final notifier = QvstResponseListFormNotifier();

    notifier.addResponse(
      QvstAnswerEntity(
        answer: 'answer1',
        value: 'value',
      ),
    );

    expect(notifier.state, isNotNull);
    expect(notifier.state.length, 1);

    notifier.addResponse(
      QvstAnswerEntity(
        answer: 'answer2',
        value: 'value',
      ),
    );

    expect(notifier.state, isNotNull);
    expect(notifier.state.length, 2);

    notifier.removeResponse(
      QvstAnswerEntity(
        answer: 'answer1',
        value: 'value',
      ),
    );

    expect(notifier.state, isNotNull);
    expect(notifier.state.length, 1);

    notifier.clear();

    expect(notifier.state, isNotNull);
    expect(notifier.state.length, 0);
  });
}
