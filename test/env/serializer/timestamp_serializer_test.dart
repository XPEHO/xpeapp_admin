import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/env/serializer/timestamp_serializer.dart';

void main() {
  test('timestamp serializer ...', () async {
    const converter = TimestampConverter();

    final dateTest = DateTime(
      2023,
      1,
      1,
    );

    final timestamp = Timestamp.fromDate(
      dateTest,
    );

    final json = converter.toJson(timestamp);

    expect(
      DateTime.fromMillisecondsSinceEpoch(json),
      dateTest,
    );

    final timestampFromJson = converter.fromJson(timestamp);

    expect(
      timestampFromJson.toDate(),
      dateTest,
    );
  });
}
