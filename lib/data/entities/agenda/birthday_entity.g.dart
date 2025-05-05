// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birthday_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BirthdayEntityImpl _$$BirthdayEntityImplFromJson(Map<String, dynamic> json) =>
    _$BirthdayEntityImpl(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$BirthdayEntityImplToJson(
        _$BirthdayEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'birthdate': instance.birthdate.toIso8601String(),
      'email': instance.email,
    };
