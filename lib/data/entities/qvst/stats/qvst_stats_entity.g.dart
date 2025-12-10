// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_stats_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QvstStatsEntityImpl _$$QvstStatsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QvstStatsEntityImpl(
      campaignId: json['campaignId'] as String? ?? '',
      campaignName: json['campaignName'] as String? ?? '',
      campaignStatus: json['campaignStatus'] as String? ?? '',
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      themes: (json['themes'] as List<dynamic>)
          .map((e) => QvstThemeEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QvstQuestionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      action: json['action'] as String?,
    );

Map<String, dynamic> _$$QvstStatsEntityImplToJson(
        _$QvstStatsEntityImpl instance) =>
    <String, dynamic>{
      'campaignId': instance.campaignId,
      'campaignName': instance.campaignName,
      'campaignStatus': instance.campaignStatus,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'themes': instance.themes,
      'questions': instance.questions,
      'action': instance.action,
    };
