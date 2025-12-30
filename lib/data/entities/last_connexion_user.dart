import 'package:freezed_annotation/freezed_annotation.dart';

part 'last_connexion_user.freezed.dart';
part 'last_connexion_user.g.dart';

@Freezed()
abstract class LastConnexionUser with _$LastConnexionUser {
  @JsonSerializable(explicitToJson: true)
  const factory LastConnexionUser({
    @JsonKey(name: 'user_nicename') required String userNicename,
    @JsonKey(name: 'last_connection') required DateTime lastConnexion,
  }) = _LastConnexionUser;

  factory LastConnexionUser.fromJson(Map<String, dynamic> json) =>
      _$LastConnexionUserFromJson(json);
}
