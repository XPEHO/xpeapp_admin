import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';

part 'qvst_stats_entity.freezed.dart';
part 'qvst_stats_entity.g.dart';

@Freezed()
class QvstStatsEntity with _$QvstStatsEntity {
  const factory QvstStatsEntity({
    required String campaignId,
    required String campaignName,
    required String campaignStatus,
    required String startDate,
    required String endDate,
    required List<QvstQuestionEntity> questions,
    String? action,
  }) = _QvstStatsEntity;

  factory QvstStatsEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstStatsEntityFromJson(json);
}
