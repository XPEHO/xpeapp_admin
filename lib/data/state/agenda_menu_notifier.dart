import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/enum/agenda_menu.dart';

class SelectedAgendaMenuNotifier extends StateNotifier<AgendaMenu?> {
  SelectedAgendaMenuNotifier()
      : super(
          AgendaMenu.events,
        );

  void changeMenu(AgendaMenu menu) {
    state = menu;
  }

  void clearMenu() {
    state = null;
    changeMenu(AgendaMenu.events);
  }
}
