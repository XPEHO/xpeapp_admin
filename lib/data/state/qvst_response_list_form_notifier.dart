import 'package:flutter_riverpod/legacy.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';

class QvstResponseListFormNotifier
    extends StateNotifier<List<QvstAnswerEntity>> {
  QvstResponseListFormNotifier() : super([]);

  void addResponse(QvstAnswerEntity response) {
    state = [...state, response];
  }

  void removeResponse(QvstAnswerEntity response) {
    state = state.where((element) => element != response).toList();
  }

  void clear() {
    state = [];
  }
}
