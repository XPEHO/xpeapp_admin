// ignore_for_file: subtype_of_sealed_class, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/presentation/widgets/picture_profile.dart';

void main() {
  testWidgets('Test PictureProfile widget', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Build the PictureProfile widget
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: PictureProfile(
              imagePath: Future.value('https://via.placeholder.com/150'),
              size: 100,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify that the Image is displayed
    expect(find.byType(Image), findsOneWidget);
  });
}
