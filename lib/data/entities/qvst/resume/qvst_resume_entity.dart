import 'package:freezed_annotation/freezed_annotation.dart';

part 'qvst_resume_entity.freezed.dart';
part 'qvst_resume_entity.g.dart';

@Freezed()
abstract class QvstResumeEntity with _$QvstResumeEntity {
  const factory QvstResumeEntity({
    required String id,
    required String theme,
    required String question,
    required String numberOfAnswers,
    required String averageAnswer,
    required String maxValueAnswer,
  }) = _QvstResumeEntity;

  factory QvstResumeEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstResumeEntityFromJson(json);
}
