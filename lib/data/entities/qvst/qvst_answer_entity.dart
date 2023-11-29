/*
{
                "answer": "Mal",
                "value": "1"
            },
            */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'qvst_answer_entity.freezed.dart';
part 'qvst_answer_entity.g.dart';

@Freezed()
class QvstAnswerEntity with _$QvstAnswerEntity {
  factory QvstAnswerEntity({
    required String answer,
    required String value,
  }) = _QvstAnswerEntity;

  factory QvstAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstAnswerEntityFromJson(json);
}
