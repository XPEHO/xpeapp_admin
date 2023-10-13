import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';

abstract class NewsletterRepository {
  Future<void> addNewsletter(NewsletterEntity newsletter);

  Future<void> updateNewsletter(NewsletterEntity newsletter);
}
