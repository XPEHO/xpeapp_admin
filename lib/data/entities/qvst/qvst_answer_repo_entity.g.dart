// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_answer_repo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QvstAnswerRepoEntityImpl _$$QvstAnswerRepoEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QvstAnswerRepoEntityImpl(
      id: json['id'] as String,
      repoName: json['repoName'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => QvstAnswerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QvstAnswerRepoEntityImplToJson(
        _$QvstAnswerRepoEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'repoName': instance.repoName,
      'answers': instance.answers,
    };
