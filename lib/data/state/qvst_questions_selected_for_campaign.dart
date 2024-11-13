import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';

class QvstQuestionsSelectedForCampaign
    extends StateNotifier<List<QvstQuestionEntity>> {
  QvstQuestionsSelectedForCampaign()
      : super(
          [],
        );

  void reset() {
    state = [];
  }

  void toggleQuestion(QvstQuestionEntity question) {
    if (state.contains(question)) {
      state = state.where((element) => element != question).toList();
    } else {
      state = [...state, question];
    }
  }
}
