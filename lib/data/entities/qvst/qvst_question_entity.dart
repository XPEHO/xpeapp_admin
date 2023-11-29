// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';

part 'qvst_question_entity.freezed.dart';
part 'qvst_question_entity.g.dart';

@Freezed()
class QvstQuestionEntity with _$QvstQuestionEntity {
  factory QvstQuestionEntity({
    String? id,
    required String theme,
    String? idTheme,
    required String question,
    @JsonSerializable(explicitToJson: true)
    required List<QvstAnswerEntity> answers,
  }) = _QvstQuestionEntity;

  factory QvstQuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstQuestionEntityFromJson(json);
}
