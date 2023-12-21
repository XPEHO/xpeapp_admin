// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_campaign_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QvstCampaignEntityImpl _$$QvstCampaignEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QvstCampaignEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      theme: QvstThemeEntity.fromJson(json['theme'] as Map<String, dynamic>),
      status: json['status'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      participationRate: json['participation_rate'] as String,
    );

Map<String, dynamic> _$$QvstCampaignEntityImplToJson(
        _$QvstCampaignEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'theme': instance.theme,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'participation_rate': instance.participationRate,
    };
