import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/user_access_entity.dart';

void main() {
  test('user access entity ...', () async {
    UserAccessEntity userAccessEntity = UserAccessEntity(
      idAccess: 'idAccess',
      description: 'description',
      name: 'name',
    );

    expect(userAccessEntity.idAccess, 'idAccess');

    final userAccessEntityJson = userAccessEntity.toJson();

    expect(userAccessEntityJson['idAccess'], 'idAccess');

    userAccessEntityJson.update(
      'idAccess',
      (value) => 'idAccess2',
    );

    final userAccessFromJson = UserAccessEntity.fromJson(
      userAccessEntityJson,
    );

    expect(userAccessFromJson.idAccess, 'idAccess2');
  });
}
