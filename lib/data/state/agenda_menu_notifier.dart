import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/agenda/agenda_menu_selected.dart';
import 'package:xpeapp_admin/data/enum/agenda_menu.dart';

class AgendaMenuNotifier extends StateNotifier<AgendaMenuSelected?> {
  AgendaMenuNotifier()
      : super(
          AgendaMenuSelected(menu: AgendaMenu.events),
        );

  void changeMenu(AgendaMenu menu, {String? id}) {
    state = AgendaMenuSelected(
      menu: menu,
      id: id,
    );
  }

  void clearMenu() {
    state = null;
    changeMenu(AgendaMenu.events);
  }
}
