// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_resume_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QvstResumeEntity _$QvstResumeEntityFromJson(Map<String, dynamic> json) =>
    _QvstResumeEntity(
      id: json['id'] as String,
      theme: json['theme'] as String,
      question: json['question'] as String,
      numberOfAnswers: json['numberOfAnswers'] as String,
      averageAnswer: json['averageAnswer'] as String,
      maxValueAnswer: json['maxValueAnswer'] as String,
    );

Map<String, dynamic> _$QvstResumeEntityToJson(_QvstResumeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'theme': instance.theme,
      'question': instance.question,
      'numberOfAnswers': instance.numberOfAnswers,
      'averageAnswer': instance.averageAnswer,
      'maxValueAnswer': instance.maxValueAnswer,
    };
