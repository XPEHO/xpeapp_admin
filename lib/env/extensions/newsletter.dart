import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';

extension NewsletterExtension on NewsletterEntity {
  Map<String, dynamic> toFirebase() => {
        'date': date,
        'summary': summary,
        'pdfUrl': pdfUrl,
        'publicationDate': publicationDate,
      };
}
