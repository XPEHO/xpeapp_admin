// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_question_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QvstQuestionSample _$QvstQuestionSampleFromJson(Map<String, dynamic> json) =>
    _QvstQuestionSample(
      id: json['id'] as String,
      idTheme: json['id_theme'] as String,
      question: json['question'] as String,
      responseRepo: json['response_repo'] as String,
      reversedQuestion: json['reversed_question'] as bool,
      noLongerUsed: json['no_longer_used'] as bool,
    );

Map<String, dynamic> _$QvstQuestionSampleToJson(_QvstQuestionSample instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_theme': instance.idTheme,
      'question': instance.question,
      'response_repo': instance.responseRepo,
      'reversed_question': instance.reversedQuestion,
      'no_longer_used': instance.noLongerUsed,
    };
