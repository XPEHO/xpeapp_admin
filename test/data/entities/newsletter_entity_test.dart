import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';

void main() {
  test('newsletter entity ...', () async {
    final newsletterTesting = {
      "id": "1",
      "summary": "summary",
      "picture": "picture",
      "date": Timestamp.now(),
      "pdfUrl": "pdfUrl",
      "publicationDate": Timestamp.now(),
    };

    final newsletterEntity = NewsletterEntity.fromJson(
      newsletterTesting,
    );

    expect(newsletterEntity.summary, newsletterTesting['summary']);
  });
}
