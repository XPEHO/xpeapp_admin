import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/env/extensions/newsletter.dart';

void main() {
  test(
    'newsletter extension ...',
    () {
      NewsletterEntity entity = NewsletterEntity(
        id: "id",
        summary: "title",
        publicationDate: Timestamp.now(),
        pdfUrl: "pdfUrl",
        date: Timestamp.now(),
        picture: "picture",
      );

      final extensionNewsletter = entity.toFirebase();

      expect(extensionNewsletter['date'], entity.date);
      expect(extensionNewsletter['picture'], null);
    },
  );
}
