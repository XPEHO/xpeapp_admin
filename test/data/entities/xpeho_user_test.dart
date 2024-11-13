import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';

void main() {
  test('XpehoUser fromFirebase creates an instance with correct image', () {
    final userJson = {
      'image': 'test_image_url',
    };

    final xpehoUser = XpehoUser.fromFirebase(userJson);

    expect(xpehoUser.image, 'test_image_url');
    expect(xpehoUser.email, isNull);
    expect(xpehoUser.password, isNull);
    expect(xpehoUser.token, isNull);
  });

  test('XpehoUser fromFirebase handles null image', () {
    final userJson = {
      'image': null,
    };

    final xpehoUser = XpehoUser.fromFirebase(userJson);

    expect(xpehoUser.image, isNull);
    expect(xpehoUser.email, isNull);
    expect(xpehoUser.password, isNull);
    expect(xpehoUser.token, isNull);
  });
}
