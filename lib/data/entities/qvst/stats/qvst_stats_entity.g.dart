// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_stats_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QvstStatsEntityImpl _$$QvstStatsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QvstStatsEntityImpl(
      campaignId: json['campaignId'] as String,
      campaignName: json['campaignName'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QvstQuestionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QvstStatsEntityImplToJson(
        _$QvstStatsEntityImpl instance) =>
    <String, dynamic>{
      'campaignId': instance.campaignId,
      'campaignName': instance.campaignName,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'questions': instance.questions,
    };
