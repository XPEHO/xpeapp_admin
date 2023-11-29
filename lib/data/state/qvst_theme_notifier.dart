import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';

class QvstThemeNotifier extends StateNotifier<QvstThemeEntity?> {
  QvstThemeNotifier() : super(null);

  void setTheme(QvstThemeEntity? theme) {
    state = theme;
  }
}
