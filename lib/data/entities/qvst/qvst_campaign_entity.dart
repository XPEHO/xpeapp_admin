import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';

part 'qvst_campaign_entity.freezed.dart';
part 'qvst_campaign_entity.g.dart';

@Freezed()
class QvstCampaignEntity with _$QvstCampaignEntity {
  const factory QvstCampaignEntity({
    required String id,
    required String name,
    required List<QvstThemeEntity> themes,
    required String status,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'participation_rate') required String participationRate,
  }) = _QvstCampaignEntity;

  factory QvstCampaignEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstCampaignEntityFromJson(json);
}
