// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_question_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QvstQuestionEntityImpl _$$QvstQuestionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QvstQuestionEntityImpl(
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
    );

Map<String, dynamic> _$$QvstQuestionEntityImplToJson(
        _$QvstQuestionEntityImpl instance) =>
    <String, dynamic>{
      'question_id': instance.id,
      'question': instance.question,
      'theme': instance.theme,
      'theme_id': instance.idTheme,
      'answer_repo_id': instance.answerRepoId,
      'numberAsked': instance.numberAsked,
      'answers': instance.answers,
    };
