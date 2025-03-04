// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventsEntityImpl _$$EventsEntityImplFromJson(Map<String, dynamic> json) =>
    _$EventsEntityImpl(
      id: json['id'] as String?,
      date: json['date'] as String,
      start_time: json['start_time'] as String?,
      end_time: json['end_time'] as String?,
      title: json['title'] as String,
      location: json['location'] as String?,
      type: EventsTypeEntity.fromJson(json['type'] as Map<String, dynamic>),
      topic: json['topic'] as String?,
    );

Map<String, dynamic> _$$EventsEntityImplToJson(_$EventsEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'title': instance.title,
      'location': instance.location,
      'type': instance.type.toJson(),
      'topic': instance.topic,
    };
