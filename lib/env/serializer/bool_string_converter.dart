import 'package:freezed_annotation/freezed_annotation.dart';

/// Converts bool/string/"0"/"1" to "0" or "1" string
/// Handles API responses that may return boolean or string values
class BoolOrStringToStringConverter implements JsonConverter<String, dynamic> {
  const BoolOrStringToStringConverter();

  @override
  String fromJson(dynamic value) {
    if (value == null) return '0';
    if (value is bool) return value ? '1' : '0';
    if (value is int) return value == 1 ? '1' : '0';
    final str = value.toString().toLowerCase();
    if (str == 'true' || str == '1' || str == 'oui' || str == 'yes') {
      return '1';
    }
    return '0';
  }

  @override
  dynamic toJson(String value) => value;
}
