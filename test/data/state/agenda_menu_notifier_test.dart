import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/enum/agenda_menu.dart';
import 'package:xpeapp_admin/data/state/agenda_menu_notifier.dart';

void main() {
  test('AgendaMenuNotifier initial state', () {
    final notifier = SelectedAgendaMenuNotifier();

    expect(notifier.state, isNotNull);
    expect(notifier.state, AgendaMenu.events);
  });

  test('AgendaMenuNotifier changeMenu updates the state', () {
    final notifier = SelectedAgendaMenuNotifier();

    notifier.changeMenu(AgendaMenu.birthdays);

    expect(notifier.state, isNotNull);
    expect(notifier.state, AgendaMenu.birthdays);
  });

  test(
      'AgendaMenuNotifier clearMenu sets state to null and then to AgendaMenu.events',
      () {
    final notifier = SelectedAgendaMenuNotifier();

    notifier.clearMenu();

    expect(notifier.state, isNotNull);
    expect(notifier.state, AgendaMenu.events);
  });
}
