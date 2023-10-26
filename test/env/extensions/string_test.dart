import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';

void main() {
  test('string ...', () async {
    const string = 'hello world';

    expect(
      string.capitalize(),
      'Hello world',
    );
  });
}
