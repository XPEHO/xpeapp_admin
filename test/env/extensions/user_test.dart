import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xpeapp_admin/env/extensions/user.dart';

import 'user_test.mocks.dart';

@GenerateMocks([
  User,
])
void main() {
  late User fakeUser;

  setUpAll(() {
    fakeUser = MockUser();
  });

  test('user ...', () async {
    when(
      fakeUser.displayName,
    ).thenReturn('test');

    String name = fakeUser.getName();
    expect(name, fakeUser.displayName);

    when(
      fakeUser.displayName,
    ).thenReturn(null);

    when(
      fakeUser.email,
    ).thenReturn('john.test@test.com');

    name = fakeUser.getName();
    expect(name, 'John TEST');
  });
}
