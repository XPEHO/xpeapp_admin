import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/admin_users.dart';

void main() {
  test('AdminUsers fromJson and toJson', () async {
    const usersList = ['user1', 'user2', 'user3'];

    final adminUsers = AdminUsers.fromJson({
      'users': usersList,
    });

    expect(adminUsers.users, usersList);

    final json = adminUsers.toJson();

    expect(json['users'], usersList);

    final adminUsersJson = AdminUsers.fromJson(json);

    expect(adminUsersJson.users, usersList);
  });
}
