// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idea_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IdeaEntity _$IdeaEntityFromJson(Map<String, dynamic> json) => _IdeaEntity(
      id: json['id'] as String,
      description: json['description'] as String,
      context: json['context'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$IdeaEntityToJson(_IdeaEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'context': instance.context,
      'created_at': instance.createdAt.toIso8601String(),
      'status': instance.status,
    };
