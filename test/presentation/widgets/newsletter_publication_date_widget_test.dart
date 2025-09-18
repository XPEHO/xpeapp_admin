import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/enum/newsletter_publication_moment.dart';
import 'package:xpeapp_admin/presentation/widgets/newsletter_publication_date_widget.dart';

void main() {
  testWidgets('Test NewsletterPublicationDateWidget widget',
      (WidgetTester tester) async {
    // Build the NewsletterPublicationDateWidget widget
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: NewsletterPublicationDateWidget(),
          ),
        ),
      ),
    );

    // Verify that the widget has the correct text
    expect(find.text('Maintenant'), findsOneWidget);
    expect(find.text('Plus tard'), findsOneWidget);

    // Tap the 'Maintenant' radio button and verify that it is selected
    await tester.tap(find.text('Maintenant'));

    // Rebuild the widget with the new item
    await tester.pump();

    // Verify that the 'Maintenant' radio button is selected
    expect(
      find.byWidgetPredicate((Widget widget) =>
          widget is RadioListTile<NewsletterPublicationMoment> &&
          widget.value == NewsletterPublicationMoment.now),
      findsOneWidget,
    );
  });
}
