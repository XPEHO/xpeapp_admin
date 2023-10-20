import 'package:cloud_firestore/cloud_firestore.dart';

enum NewsletterPublicationMoment {
  now,
  later,
}

class NewsletterPublication {
  final NewsletterPublicationMoment moment;
  final Timestamp date;

  NewsletterPublication({
    required this.moment,
    required this.date,
  });

  factory NewsletterPublication.now() {
    return NewsletterPublication(
      moment: NewsletterPublicationMoment.now,
      date: Timestamp.now(),
    );
  }

  factory NewsletterPublication.later(Timestamp date) {
    return NewsletterPublication(
      moment: NewsletterPublicationMoment.later,
      date: date,
    );
  }
}
