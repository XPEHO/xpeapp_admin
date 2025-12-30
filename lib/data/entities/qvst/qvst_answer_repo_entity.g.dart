// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_answer_repo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QvstAnswerRepoEntity _$QvstAnswerRepoEntityFromJson(
        Map<String, dynamic> json) =>
    _QvstAnswerRepoEntity(
      id: json['id'] as String,
      repoName: json['repoName'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => QvstAnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QvstAnswerRepoEntityToJson(
        _QvstAnswerRepoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repoName': instance.repoName,
      'answers': instance.answers,
    };
