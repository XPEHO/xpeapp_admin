// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idea_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdeaEntityImpl _$$IdeaEntityImplFromJson(Map<String, dynamic> json) =>
    _$IdeaEntityImpl(
      id: json['id'] as String,
      description: json['description'] as String,
      context: json['context'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$IdeaEntityImplToJson(_$IdeaEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'context': instance.context,
      'created_at': instance.createdAt.toIso8601String(),
      'status': instance.status,
    };
