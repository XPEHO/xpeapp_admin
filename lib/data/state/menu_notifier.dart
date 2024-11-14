import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/menu_entity.dart';

class MenuNotifier extends StateNotifier<MenuEntity?> {
  MenuNotifier() : super(null);

  void reset() {
    state = null;
  }

  void setMenu(MenuEntity menu) {
    state = menu;
  }
}
