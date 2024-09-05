import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/menu_entity.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';
import 'package:xpeapp_admin/data/state/menu_notifier.dart';

void main() {
  testWidgets('menu notifier ...', (tester) async {
    final notifier = MenuNotifier();

    expect(notifier.state, isNull);

    notifier.setMenu(MenuEntity(
      id: 1,
      title: 'Menu 1',
      asset: Icons.abc,
      access: AdminAccess.addNewsletters,
    ));

    expect(notifier.state, isNotNull);
  });
}
