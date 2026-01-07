import 'package:freezed_annotation/freezed_annotation.dart';

part 'qvst_answer_entity.freezed.dart';
part 'qvst_answer_entity.g.dart';

@Freezed()
abstract class QvstAnswerEntity with _$QvstAnswerEntity {
  factory QvstAnswerEntity({
    required String id,
    required String answer,
    required String value,
    int? numberAnswered,
  }) = _QvstAnswerEntity;

  factory QvstAnswerEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstAnswerEntityFromJson(json);
}
