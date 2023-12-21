import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/data/state/qvst_theme_notifier.dart';

void main() {
  QvstThemeNotifier qvstThemeNotifier = QvstThemeNotifier();

  test('qvst theme notifier ...', () async {
    qvstThemeNotifier.setTheme(null);
    expect(qvstThemeNotifier.state, null);

    qvstThemeNotifier.setTheme(QvstThemeEntity(
      id: '1',
      name: 'Le travail',
    ));
    expect(qvstThemeNotifier.state, isNotNull);
    expect(qvstThemeNotifier.state!.id, '1');
    expect(qvstThemeNotifier.state!.name, 'Le travail');
  });
}
