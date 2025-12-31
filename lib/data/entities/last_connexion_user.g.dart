// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_connexion_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LastConnexionUser _$LastConnexionUserFromJson(Map<String, dynamic> json) =>
    _LastConnexionUser(
      lastConnexion: DateTime.parse(json['last_connection'] as String),
      firstname: json['first_name'] as String,
      lastname: json['last_name'] as String,
    );

Map<String, dynamic> _$LastConnexionUserToJson(_LastConnexionUser instance) =>
    <String, dynamic>{
      'last_connection': instance.lastConnexion.toIso8601String(),
      'first_name': instance.firstname,
      'last_name': instance.lastname,
    };
