// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_answer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QvstAnswerEntity _$QvstAnswerEntityFromJson(Map<String, dynamic> json) =>
    _QvstAnswerEntity(
      id: json['id'] as String,
      answer: json['answer'] as String,
      value: json['value'] as String,
      numberAnswered: (json['numberAnswered'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QvstAnswerEntityToJson(_QvstAnswerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'value': instance.value,
      'numberAnswered': instance.numberAnswered,
    };
