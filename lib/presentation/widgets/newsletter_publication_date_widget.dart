import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';
import 'package:xpeapp_admin/providers.dart';

class NewsletterPublicationDateWidget extends ConsumerWidget {
  const NewsletterPublicationDateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsletterPublication? newsletterPublicationDate =
        ref.watch(newsletterPublicationProvider);

    return RadioGroup<NewsletterPublicationMoment>(
      groupValue: newsletterPublicationDate?.moment,
      onChanged: (NewsletterPublicationMoment? value) {
        if (value != null) {
          ref
              .read(newsletterPublicationProvider.notifier)
              .setPublicationMoment(value);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: RadioListTile<NewsletterPublicationMoment>(
              value: NewsletterPublicationMoment.now,
              title: const Text(
                'Maintenant',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Expanded(
            child: RadioListTile<NewsletterPublicationMoment>(
              value: NewsletterPublicationMoment.later,
              title: const Text(
                'Plus tard',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
