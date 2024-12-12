import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/data/state/qvst_menu_notifier.dart';

void main() {
  test('qvst menu notifier ...', () async {
    final notifier = QvstMenuNotifier();

    const defaultMenu = QvstMenu.theme;
    const menu = QvstMenu.campaign;

    expect(
      notifier.state?.menu,
      defaultMenu,
    );

    notifier.changeMenu(
      menu,
    );

    expect(
      notifier.state?.menu,
      menu,
    );

    notifier.clearMenu();

    expect(
      notifier.state?.menu,
      defaultMenu,
    );
  });
}
