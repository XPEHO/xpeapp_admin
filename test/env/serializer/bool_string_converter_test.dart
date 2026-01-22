import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/env/serializer/bool_string_converter.dart';

void main() {
  const converter = BoolOrStringToStringConverter();

  group('BoolOrStringToStringConverter', () {
    test('fromJson handles null', () {
      expect(converter.fromJson(null), '0');
    });
    test('fromJson handles bool true/false', () {
      expect(converter.fromJson(true), '1');
      expect(converter.fromJson(false), '0');
    });
    test('fromJson handles int 1/0', () {
      expect(converter.fromJson(1), '1');
      expect(converter.fromJson(0), '0');
    });
    test('fromJson handles string values', () {
      expect(converter.fromJson('1'), '1');
      expect(converter.fromJson('0'), '0');
      expect(converter.fromJson('true'), '1');
      expect(converter.fromJson('false'), '0');
      expect(converter.fromJson('oui'), '1');
      expect(converter.fromJson('yes'), '1');
      expect(converter.fromJson('no'), '0');
      expect(converter.fromJson('non'), '0');
    });
    test('toJson returns the same string', () {
      expect(converter.toJson('1'), '1');
      expect(converter.toJson('0'), '0');
    });
  });
}
