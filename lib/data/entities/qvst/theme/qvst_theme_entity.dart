import 'package:freezed_annotation/freezed_annotation.dart';

part 'qvst_theme_entity.freezed.dart';
part 'qvst_theme_entity.g.dart';

@Freezed()
class QvstThemeEntity with _$QvstThemeEntity {
  factory QvstThemeEntity({
    @JsonKey(defaultValue: '') required String id,
    @JsonKey(defaultValue: '') required String name,
  }) = _QvstThemeEntity;

  factory QvstThemeEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstThemeEntityFromJson(json);
}
