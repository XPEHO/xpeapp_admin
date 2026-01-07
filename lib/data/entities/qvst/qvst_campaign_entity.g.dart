// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_campaign_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QvstCampaignEntity _$QvstCampaignEntityFromJson(Map<String, dynamic> json) =>
    _QvstCampaignEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      themes: (json['themes'] as List<dynamic>)
          .map((e) => QvstThemeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      participationRate: json['participation_rate'] as String,
    );

Map<String, dynamic> _$QvstCampaignEntityToJson(_QvstCampaignEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'themes': instance.themes,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'participation_rate': instance.participationRate,
    };
