import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/newsletter_card.dart';

void main() {
  testWidgets(
    'newsletter card ...',
    (tester) async {
      final dateTesting = DateTime(2021, 10, 10);
      final newsletter = NewsletterEntity(
        id: 'id',
        date: Timestamp.fromDate(dateTesting),
        summary: 'summary',
        pdfUrl: 'pdfUrl',
        publicationDate: Timestamp.fromDate(dateTesting),
      );
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/newsletter/detail': (context) => const Scaffold(
                  body: Text('/newsletter/detail'),
                ),
          },
          home: Scaffold(
            body: NewsletterCard(
              newsletter: newsletter,
            ),
          ),
        ),
      );

      expect(find.text('Newsletter du 10/10/2021'), findsOneWidget);

      // Tap the InkWell
      await tester.tap(find.byType(InkWell).first);

      // Wait for the Navigator to push the new route
      await tester.pumpAndSettle();

      // Verify that the Navigator pushed the correct route
      expect(find.text('/newsletter/detail'), findsOneWidget);
    },
  );
}
