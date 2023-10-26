import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';

void main() {
  test('newsletter publication moment ...', () {
    final publicationNow = NewsletterPublication.now();
    final publicationLater = NewsletterPublication.later(Timestamp.now());

    expect(publicationNow.moment, NewsletterPublicationMoment.now);
    expect(publicationLater.moment, NewsletterPublicationMoment.later);
  });
}
