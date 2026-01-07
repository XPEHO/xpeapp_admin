// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventsEntity _$EventsEntityFromJson(Map<String, dynamic> json) =>
    _EventsEntity(
      id: json['id'] as String?,
      date: DateTime.parse(json['date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      startTime: _fromJsonTime(json['start_time'] as String?),
      endTime: _fromJsonTime(json['end_time'] as String?),
      title: json['title'] as String,
      location: json['location'] as String?,
      typeId: json['type_id'] as String,
      topic: json['topic'] as String?,
    );

Map<String, dynamic> _$EventsEntityToJson(_EventsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'start_time': _toJsonTime(instance.startTime),
      'end_time': _toJsonTime(instance.endTime),
      'title': instance.title,
      'location': instance.location,
      'type_id': instance.typeId,
      'topic': instance.topic,
    };
