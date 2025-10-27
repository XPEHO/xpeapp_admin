import 'package:freezed_annotation/freezed_annotation.dart';

part 'idea_entity.freezed.dart';
part 'idea_entity.g.dart';

@Freezed()
class IdeaEntity with _$IdeaEntity {
  @JsonSerializable(explicitToJson: true)
  const factory IdeaEntity({
    required String id,
    required String description,
    required String context,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required String status,
  }) = _IdeaEntity;

  factory IdeaEntity.fromJson(Map<String, dynamic> json) =>
      _$IdeaEntityFromJson(json);
}
