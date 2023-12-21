import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_menu_selected.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';

class QvstMenuNotifier extends StateNotifier<QvstMenuSelected?> {
  QvstMenuNotifier() : super(null);

  void changeMenu(QvstMenu menu, {String? id}) {
    state = QvstMenuSelected(
      menu: menu,
      id: id,
    );
  }

  void clearMenu() {
    state = null;
  }
}
