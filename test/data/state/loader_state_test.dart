import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/state/loader_state.dart';

void main() {
  test('loader state ...', () async {
    final notifier = LoaderState();

    expect(notifier.state, false);

    notifier.showLoader();

    expect(notifier.state, true);

    notifier.hideLoader();

    expect(notifier.state, false);
  });
}
