// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventsEntityImpl _$$EventsEntityImplFromJson(Map<String, dynamic> json) =>
    _$EventsEntityImpl(
      id: json['id'] as String?,
      date: json['date'] as String,
      heure_debut: json['heure_debut'] as String?,
      heure_fin: json['heure_fin'] as String?,
      titre: json['titre'] as String,
      lieu: json['lieu'] as String?,
      type_label: json['type_label'] as String,
      topic: json['topic'] as String?,
    );

Map<String, dynamic> _$$EventsEntityImplToJson(_$EventsEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'heure_debut': instance.heure_debut,
      'heure_fin': instance.heure_fin,
      'titre': instance.titre,
      'lieu': instance.lieu,
      'type_label': instance.type_label,
      'topic': instance.topic,
    };
