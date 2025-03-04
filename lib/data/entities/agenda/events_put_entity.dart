// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_put_entity.freezed.dart';
part 'events_put_entity.g.dart';

@Freezed()
class EventsPutEntity with _$EventsPutEntity {
  @JsonSerializable(explicitToJson: true)
  const factory EventsPutEntity({
    String? id,
    required String date,
    String? start_time,
    String? end_time,
    required String title,
    String? location,
    required String type_id,
    String? topic,
  }) = _EventsPutEntity;

  factory EventsPutEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsPutEntityFromJson(json);
}
