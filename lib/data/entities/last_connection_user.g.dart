// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_connection_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LastConnectionUser _$LastConnectionUserFromJson(Map<String, dynamic> json) =>
    _LastConnectionUser(
      lastConnexion: DateTime.parse(json['last_connection'] as String),
      firstname: json['first_name'] as String,
      lastname: json['last_name'] as String,
    );

Map<String, dynamic> _$LastConnectionUserToJson(_LastConnectionUser instance) =>
    <String, dynamic>{
      'last_connection': instance.lastConnexion.toIso8601String(),
      'first_name': instance.firstname,
      'last_name': instance.lastname,
    };
