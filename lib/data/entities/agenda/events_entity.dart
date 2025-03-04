// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_entity.freezed.dart';
part 'events_entity.g.dart';

@Freezed()
class EventsEntity with _$EventsEntity {
  @JsonSerializable(explicitToJson: true)
  const factory EventsEntity({
    String? id,
    required String date,
    required String? heure_debut,
    required String? heure_fin,
    required String titre,
    required String? lieu,
    required String type_label,
    required String? topic,
  }) = _EventsEntity;

  factory EventsEntity.fromJson(Map<String, dynamic> json) =>
      _$EventsEntityFromJson(json);
}
