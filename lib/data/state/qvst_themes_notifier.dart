import 'package:flutter_riverpod/legacy.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';

class QvstThemesNotifier extends StateNotifier<List<QvstThemeEntity>> {
  QvstThemesNotifier() : super([]);

  void addTheme(QvstThemeEntity theme) {
    if (!state.contains(theme)) {
      state = [...state, theme];
    }
  }

  void removeTheme(QvstThemeEntity theme) {
    state = state.where((t) => t.id != theme.id).toList();
  }

  void toggleTheme(QvstThemeEntity theme) {
    if (state.any((t) => t.id == theme.id)) {
      removeTheme(theme);
    } else {
      addTheme(theme);
    }
  }

  void setThemes(List<QvstThemeEntity> themes) {
    state = themes;
  }

  void reset() {
    state = [];
  }

  bool isSelected(QvstThemeEntity theme) {
    return state.any((t) => t.id == theme.id);
  }

  void setTheme(QvstThemeEntity? theme) {
    if (theme != null) {
      setThemes([theme]);
    } else {
      reset();
    }
  }
}
