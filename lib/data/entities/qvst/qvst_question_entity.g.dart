// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_question_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QvstQuestionEntityImpl _$$QvstQuestionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QvstQuestionEntityImpl(
      id: json['id'] as String?,
      theme: json['theme'] as String,
      idTheme: json['idTheme'] as String?,
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => QvstAnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QvstQuestionEntityImplToJson(
        _$QvstQuestionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'theme': instance.theme,
      'idTheme': instance.idTheme,
      'question': instance.question,
      'answers': instance.answers,
    };
