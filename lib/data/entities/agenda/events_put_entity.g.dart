// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_put_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventsPutEntityImpl _$$EventsPutEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$EventsPutEntityImpl(
      id: json['id'] as String?,
      date: json['date'] as String,
      start_time: json['start_time'] as String?,
      end_time: json['end_time'] as String?,
      title: json['title'] as String,
      location: json['location'] as String?,
      type_id: json['type_id'] as String,
      topic: json['topic'] as String?,
    );

Map<String, dynamic> _$$EventsPutEntityImplToJson(
        _$EventsPutEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'title': instance.title,
      'location': instance.location,
      'type_id': instance.type_id,
      'topic': instance.topic,
    };
