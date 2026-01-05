import 'package:freezed_annotation/freezed_annotation.dart';

part 'last_connection_user.freezed.dart';
part 'last_connection_user.g.dart';

@Freezed()
abstract class LastConnectionUser with _$LastConnectionUser {
  @JsonSerializable(explicitToJson: true)
  const factory LastConnectionUser({
    @JsonKey(name: 'last_connection') required DateTime lastConnexion,
    @JsonKey(name: 'first_name') required String firstname,
    @JsonKey(name: 'last_name') required String lastname,
  }) = _LastConnectionUser;

  factory LastConnectionUser.fromJson(Map<String, dynamic> json) =>
      _$LastConnectionUserFromJson(json);
}
