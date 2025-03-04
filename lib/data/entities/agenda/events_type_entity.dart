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
    required String color_code,
  }) = _EventsTypeEntity;

  factory EventsTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsTypeEntityFromJson(json);
}
