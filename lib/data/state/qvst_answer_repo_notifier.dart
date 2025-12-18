import 'package:flutter_riverpod/legacy.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';

class QvstAnswerRepoNotifier extends StateNotifier<QvstAnswerRepoEntity?> {
  QvstAnswerRepoNotifier() : super(null);

  void setAnswerRepo(QvstAnswerRepoEntity? answerRepo) {
    state = answerRepo;
  }

  void clearAnswerRepo() {
    state = null;
  }
}
