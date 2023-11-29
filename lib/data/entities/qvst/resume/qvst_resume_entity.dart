/*
{
    "theme": "L’environnement de travail",
    "question": "Comment te sens-tu dans l'entreprise ?",
    "numberOfAnswers": "3",
    "averageAnswer": "4",
    "maxValueAnswer": "5"
}
*/
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qvst_resume_entity.freezed.dart';
part 'qvst_resume_entity.g.dart';

@Freezed()
class QvstResumeEntity with _$QvstResumeEntity {
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
