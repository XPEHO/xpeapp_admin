import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/state/filter_menu_notifier.dart';

void main() {
  group('FilterMenuNotifier', () {
    test('initial state is false', () {
      final notifier = FilterMenuNotifier();
      expect(notifier.state, isFalse);
    });

    test('open sets state to true', () {
      final notifier = FilterMenuNotifier();
      notifier.open();
      expect(notifier.state, isTrue);
    });

    test('close sets state to false', () {
      final notifier = FilterMenuNotifier();
      notifier.open();
      notifier.close();
      expect(notifier.state, isFalse);
    });

    test('toggle switches state', () {
      final notifier = FilterMenuNotifier();
      notifier.toggle();
      expect(notifier.state, isTrue);
      notifier.toggle();
      expect(notifier.state, isFalse);
    });
  });
}
