import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';

part 'qvst_answer_repo_entity.freezed.dart';
part 'qvst_answer_repo_entity.g.dart';

@Freezed(makeCollectionsUnmodifiable: true)
class QvstAnswerRepoEntity with _$QvstAnswerRepoEntity {
  factory QvstAnswerRepoEntity({
    required String id,
    required String repoName,
    required List<QvstAnswerEntity> answers,
  }) = _QvstAnswerRepoEntity;

  factory QvstAnswerRepoEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstAnswerRepoEntityFromJson(json);
}
