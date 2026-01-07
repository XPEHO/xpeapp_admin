// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';

part 'qvst_question_entity.freezed.dart';
part 'qvst_question_entity.g.dart';

@Freezed(makeCollectionsUnmodifiable: true)
abstract class QvstQuestionEntity with _$QvstQuestionEntity {
  factory QvstQuestionEntity({
    @JsonKey(name: 'question_id') String? id,
    required String question,
    String? theme,
    @JsonKey(name: 'theme_id') String? idTheme,
    @JsonKey(name: 'answer_repo_id') String? answerRepoId,
    int? numberAsked,
    @JsonSerializable(explicitToJson: true)
    @Default([])
    List<QvstAnswerEntity> answers,
    @JsonKey(name: 'is_reversed') @Default(false) bool isReversed,
  }) = _QvstQuestionEntity;

  factory QvstQuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstQuestionEntityFromJson(json);
}
