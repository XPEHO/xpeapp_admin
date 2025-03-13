// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_type_entity.freezed.dart';
part 'events_type_entity.g.dart';

@Freezed()
class EventsTypeEntity with _$EventsTypeEntity {
  @JsonSerializable(explicitToJson: true)
  const factory EventsTypeEntity({
    required String id,
    required String label,
    @JsonKey(name: 'color_code') required String colorCode,
  }) = _EventsTypeEntity;

  factory EventsTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsTypeEntityFromJson(json);
}
