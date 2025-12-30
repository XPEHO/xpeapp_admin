// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birthday_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BirthdayEntity _$BirthdayEntityFromJson(Map<String, dynamic> json) =>
    _BirthdayEntity(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$BirthdayEntityToJson(_BirthdayEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'birthdate': instance.birthdate.toIso8601String(),
      'email': instance.email,
    };
