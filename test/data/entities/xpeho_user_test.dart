import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';

void main() {
  test('xpeho user ...', () async {
    final user = {
      'uid': 'uid',
      'name': 'name',
      'email': 'email',
      'password': 'password',
      'image': 'image',
      'adminAccess': [0, 1, 2],
    };

    final xpehoUser = XpehoUser.fromJson(user);

    expect(xpehoUser.uid, 'uid');
    expect(xpehoUser.name, 'name');
    expect(xpehoUser.adminAccess != null, true);
  });
}
