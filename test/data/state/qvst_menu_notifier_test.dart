import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/data/state/qvst_menu_notifier.dart';

void main() {
  test('qvst menu notifier ...', () async {
    final notifier = QvstMenuNotifier();

    expect(notifier.state, isNull);

    notifier.changeMenu(
      QvstMenu.campaign,
    );

    expect(notifier.state, isNotNull);
  });
}
