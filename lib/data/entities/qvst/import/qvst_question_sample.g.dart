// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_question_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QvstQuestionSample _$QvstQuestionSampleFromJson(Map<String, dynamic> json) =>
    _QvstQuestionSample(
      idTheme: json['id_theme'] as String,
      question: json['question'] as String,
      responseRepo: json['response_repo'] as String,
    );

Map<String, dynamic> _$QvstQuestionSampleToJson(_QvstQuestionSample instance) =>
    <String, dynamic>{
      'id_theme': instance.idTheme,
      'question': instance.question,
      'response_repo': instance.responseRepo,
    };
