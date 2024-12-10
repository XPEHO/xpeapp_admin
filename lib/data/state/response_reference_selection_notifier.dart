import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';

class ResponseReferenceSelectionNotifier
    extends StateNotifier<QvstAnswerRepoEntity?> {
  ResponseReferenceSelectionNotifier(super.selection);

  void select(QvstAnswerRepoEntity? qvstAnswerRepoEntity) {
    state = qvstAnswerRepoEntity;
  }
}
