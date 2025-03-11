import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/agenda/agenda_menu_selected.dart';
import 'package:xpeapp_admin/data/enum/agenda_menu.dart';
import 'package:xpeapp_admin/data/state/agenda_menu_notifier.dart';

void main() {
  test('AgendaMenuNotifier initial state', () {
    final notifier = AgendaMenuNotifier();

    expect(notifier.state, isNotNull);
    expect(notifier.state, AgendaMenuSelected(menu: AgendaMenu.events));
  });

  test('AgendaMenuNotifier changeMenu updates the state', () {
    final notifier = AgendaMenuNotifier();

    notifier.changeMenu(AgendaMenu.birthdays, id: '123');

    expect(notifier.state, isNotNull);
    expect(notifier.state,
        AgendaMenuSelected(menu: AgendaMenu.birthdays, id: '123'));
  });

  test(
      'AgendaMenuNotifier clearMenu sets state to null and then to AgendaMenu.events',
      () {
    final notifier = AgendaMenuNotifier();

    notifier.clearMenu();

    expect(notifier.state, isNotNull);
    expect(notifier.state, AgendaMenuSelected(menu: AgendaMenu.events));
  });
}
