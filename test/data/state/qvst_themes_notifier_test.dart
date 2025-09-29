import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/data/state/qvst_themes_notifier.dart';

void main() {
  QvstThemesNotifier qvstThemesNotifier = QvstThemesNotifier();

  test('qvst themes notifier ...', () async {
    qvstThemesNotifier.reset();
    expect(qvstThemesNotifier.state, isEmpty);

    final theme = QvstThemeEntity(
      id: '1',
      name: 'Le travail',
    );

    qvstThemesNotifier.addTheme(theme);
    expect(qvstThemesNotifier.state, hasLength(1));
    expect(qvstThemesNotifier.state.first.id, '1');
    expect(qvstThemesNotifier.state.first.name, 'Le travail');
    expect(qvstThemesNotifier.isSelected(theme), isTrue);

    qvstThemesNotifier.removeTheme(theme);
    expect(qvstThemesNotifier.state, isEmpty);
    expect(qvstThemesNotifier.isSelected(theme), isFalse);

    qvstThemesNotifier.setTheme(theme);
    expect(qvstThemesNotifier.state, hasLength(1));

    qvstThemesNotifier.setTheme(null);
    expect(qvstThemesNotifier.state, isEmpty);
  });
}
