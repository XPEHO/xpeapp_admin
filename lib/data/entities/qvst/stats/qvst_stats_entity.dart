import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';

part 'qvst_stats_entity.freezed.dart';
part 'qvst_stats_entity.g.dart';

@Freezed()
class QvstStatsEntity with _$QvstStatsEntity {
  const factory QvstStatsEntity({
    @JsonKey(defaultValue: '') required String campaignId,
    @JsonKey(defaultValue: '') required String campaignName,
    @JsonKey(defaultValue: '') required String campaignStatus,
    @JsonKey(defaultValue: '') required String startDate,
    @JsonKey(defaultValue: '') required String endDate,
    required List<QvstThemeEntity> themes,
    required List<QvstQuestionEntity> questions,
    String? action,
  }) = _QvstStatsEntity;

  factory QvstStatsEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstStatsEntityFromJson(json);
}
