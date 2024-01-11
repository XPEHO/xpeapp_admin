import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/config.dart';

void main() {
  test('config ...', () async {
    const urlTesting = 'https://api.example.com';

    final config = Config.fromJson({
      'baseUrl': urlTesting,
    });

    expect(config.baseUrl, urlTesting);

    final json = config.toJson();

    expect(json['baseUrl'], urlTesting);

    final configJson = Config.fromJson(json);

    expect(configJson.baseUrl, urlTesting);
  });
}
