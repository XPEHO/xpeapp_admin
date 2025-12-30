// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_type_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventsTypeEntity _$EventsTypeEntityFromJson(Map<String, dynamic> json) =>
    _EventsTypeEntity(
      id: json['id'] as String,
      label: json['label'] as String,
      colorCode: json['color_code'] as String,
    );

Map<String, dynamic> _$EventsTypeEntityToJson(_EventsTypeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'color_code': instance.colorCode,
    };
