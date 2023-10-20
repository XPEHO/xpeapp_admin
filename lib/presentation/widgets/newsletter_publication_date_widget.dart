import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';
import 'package:xpeapp_admin/providers.dart';

class NewsletterPublicationDateWidget extends ConsumerWidget {
  const NewsletterPublicationDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsletterPublication? newsletterPublicationDate =
        ref.watch(newsletterPublicationProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: RadioListTile<NewsletterPublicationMoment>(
            value: NewsletterPublicationMoment.now,
            title: const Text(
              'Maintenant',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            groupValue: newsletterPublicationDate?.moment,
            onChanged: (value) {
              ref
                  .read(newsletterPublicationProvider.notifier)
                  .setPublicationMoment(value!);
            },
          ),
        ),
        Expanded(
          child: RadioListTile<NewsletterPublicationMoment>(
            value: NewsletterPublicationMoment.later,
            title: const Text(
              'Plus tard',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            groupValue: newsletterPublicationDate?.moment,
            onChanged: (value) {
              ref
                  .read(newsletterPublicationProvider.notifier)
                  .setPublicationMoment(value!);
            },
          ),
        ),
      ],
    );
  }
}
