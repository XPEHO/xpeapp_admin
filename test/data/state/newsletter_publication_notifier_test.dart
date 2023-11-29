import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';
import 'package:xpeapp_admin/data/state/newsletter_publication_notifier.dart';

void main() {
  test('newsletter publication notifier ...', () async {
    final notifier = NewsletterPublicationNotifier();

    notifier.setPublicationDate(DateTime.now());

    expect(notifier.state.date, isNotNull);

    notifier.setPublicationMoment(NewsletterPublicationMoment.now);

    expect(notifier.state.date, isNotNull);

    notifier.setPublicationMoment(NewsletterPublicationMoment.later);

    expect(notifier.state.date, isNotNull);
  });
}
