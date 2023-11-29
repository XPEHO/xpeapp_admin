/*
{
        "id": "1",
        "theme": "Le contenu du travail"
    },
    */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'qvst_theme_entity.freezed.dart';
part 'qvst_theme_entity.g.dart';

@Freezed()
class QvstThemeEntity with _$QvstThemeEntity {
  factory QvstThemeEntity({
    required String id,
    required String theme,
  }) = _QvstThemeEntity;

  factory QvstThemeEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstThemeEntityFromJson(json);
}
