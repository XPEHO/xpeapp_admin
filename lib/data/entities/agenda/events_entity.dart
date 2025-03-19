import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/datetime_picker_methods.dart';

part 'events_entity.freezed.dart';
part 'events_entity.g.dart';

@Freezed()
class EventsEntity with _$EventsEntity {
  @JsonSerializable(explicitToJson: true)
  const factory EventsEntity({
    String? id,
    required DateTime date,
    @JsonKey(name: 'start_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
    TimeOfDay? startTime,
    @JsonKey(name: 'end_time', fromJson: _fromJsonTime, toJson: _toJsonTime)
    TimeOfDay? endTime,
    required String title,
    String? location,
    @JsonKey(name: 'type_id') required String typeId,
    String? topic,
  }) = _EventsEntity;

  factory EventsEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsEntityFromJson(json);
}

TimeOfDay? _fromJsonTime(String? time) {
  if (time == null || time == '00:00:00') return null;
  return getTimeOfDayFromTimeString(time);
}

String? _toJsonTime(TimeOfDay? time) {
  if (time == null) return null;
  return getTimeStringFromTimeOfDay(time);
}
