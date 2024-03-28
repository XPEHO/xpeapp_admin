import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';

void main() {
  test('string capitalize ...', () async {
    const string = 'hello world';

    expect(
      string.capitalize(),
      'Hello world',
    );
  });

  test('string clean', () async {
    const string = 'Hello\n World';

    expect(
      string.cleanText(),
      'Hello World',
    );
  });

  test('isArchived', () {
    const archived = 'archived';
    const draft = 'draft';

    expect(
      archived.isArchived,
      true,
    );

    expect(
      draft.isArchived,
      false,
    );
  });
}
