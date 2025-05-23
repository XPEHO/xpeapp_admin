import 'package:freezed_annotation/freezed_annotation.dart';

part 'birthday_entity.freezed.dart';
part 'birthday_entity.g.dart';

@Freezed()
class BirthdayEntity with _$BirthdayEntity {
  @JsonSerializable(explicitToJson: true)
  const factory BirthdayEntity({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    required DateTime birthdate,
    String? email,
  }) = _BirthdayEntity;

  factory BirthdayEntity.fromJson(Map<String, dynamic> json) =>
      _$BirthdayEntityFromJson(json);
}
