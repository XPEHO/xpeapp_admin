// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_connexion_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LastConnexionUser _$LastConnexionUserFromJson(Map<String, dynamic> json) =>
    _LastConnexionUser(
      userNicename: json['user_nicename'] as String,
      lastConnexion: DateTime.parse(json['last_connection'] as String),
    );

Map<String, dynamic> _$LastConnexionUserToJson(_LastConnexionUser instance) =>
    <String, dynamic>{
      'user_nicename': instance.userNicename,
      'last_connection': instance.lastConnexion.toIso8601String(),
    };
