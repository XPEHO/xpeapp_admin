import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/state/qvst_questions_selected_for_campaign.dart';

void main() {
  test('qvst questions selected for campaign ...', () async {
    final notifier = QvstQuestionsSelectedForCampaign();

    final question = QvstQuestionEntity(
      id: 'id',
      question: 'question',
      theme: 'theme',
      answers: [],
    );

    expect(
      notifier.state,
      [],
    );

    notifier.toggleQuestion(
      question,
    );

    expect(
      notifier.state,
      [
        question,
      ],
    );

    notifier.toggleQuestion(
      question,
    );

    expect(
      notifier.state,
      [],
    );
  });
}
