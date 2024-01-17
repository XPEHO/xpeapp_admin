// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QvstAnswerEntityImpl _$$QvstAnswerEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QvstAnswerEntityImpl(
      id: json['id'] as String,
      answer: json['answer'] as String,
      value: json['value'] as String,
      numberAnswered: json['numberAnswered'] as int?,
    );

Map<String, dynamic> _$$QvstAnswerEntityImplToJson(
        _$QvstAnswerEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'value': instance.value,
      'numberAnswered': instance.numberAnswered,
    };
