// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';

part 'events_entity.freezed.dart';
part 'events_entity.g.dart';

@Freezed()
class EventsEntity with _$EventsEntity {
  @JsonSerializable(explicitToJson: true)
  const factory EventsEntity({
    String? id,
    required String date,
    String? start_time,
    String? end_time,
    required String title,
    String? location,
    required EventsTypeEntity type,
    String? topic,
  }) = _EventsEntity;

  factory EventsEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsEntityFromJson(json);
}
