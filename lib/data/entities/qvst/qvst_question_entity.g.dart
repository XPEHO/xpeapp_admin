// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_question_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QvstQuestionEntity _$QvstQuestionEntityFromJson(Map<String, dynamic> json) =>
    _QvstQuestionEntity(
      id: json['question_id'] as String?,
      question: json['question'] as String,
      theme: json['theme'] as String?,
      idTheme: json['theme_id'] as String?,
      answerRepoId: json['answer_repo_id'] as String?,
      numberAsked: (json['numberAsked'] as num?)?.toInt(),
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => QvstAnswerEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reversedQuestion: json['reversed_question'] == null
          ? '0'
          : const BoolOrStringToStringConverter()
              .fromJson(json['reversed_question']),
      noLongerUsed: json['no_longer_used'] == null
          ? '0'
          : const BoolOrStringToStringConverter()
              .fromJson(json['no_longer_used']),
    );

Map<String, dynamic> _$QvstQuestionEntityToJson(_QvstQuestionEntity instance) =>
    <String, dynamic>{
      'question_id': instance.id,
      'question': instance.question,
      'theme': instance.theme,
      'theme_id': instance.idTheme,
      'answer_repo_id': instance.answerRepoId,
      'numberAsked': instance.numberAsked,
      'answers': instance.answers,
      'reversed_question': const BoolOrStringToStringConverter()
          .toJson(instance.reversedQuestion),
      'no_longer_used':
          const BoolOrStringToStringConverter().toJson(instance.noLongerUsed),
    };
