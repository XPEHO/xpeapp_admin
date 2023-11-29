// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_resume_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QvstResumeEntityImpl _$$QvstResumeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QvstResumeEntityImpl(
      id: json['id'] as String,
      theme: json['theme'] as String,
      question: json['question'] as String,
      numberOfAnswers: json['numberOfAnswers'] as String,
      averageAnswer: json['averageAnswer'] as String,
      maxValueAnswer: json['maxValueAnswer'] as String,
    );

Map<String, dynamic> _$$QvstResumeEntityImplToJson(
        _$QvstResumeEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'theme': instance.theme,
      'question': instance.question,
      'numberOfAnswers': instance.numberOfAnswers,
      'averageAnswer': instance.averageAnswer,
      'maxValueAnswer': instance.maxValueAnswer,
    };
