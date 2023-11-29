import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';

class NewsletterPublicationNotifier
    extends StateNotifier<NewsletterPublication> {
  NewsletterPublicationNotifier()
      : super(
          NewsletterPublication.now(),
        );

  void setPublicationDate(DateTime date) {
    Timestamp timestamp = Timestamp.fromDate(date);
    state = NewsletterPublication.later(timestamp);
  }

  void setPublicationMoment(NewsletterPublicationMoment moment) {
    state = moment == NewsletterPublicationMoment.now
        ? NewsletterPublication.now()
        : NewsletterPublication.later(state.date);
  }
}
