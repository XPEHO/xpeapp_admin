import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/presentation/widgets/app_loader.dart';

void main() {
  testWidgets('app loader ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppLoader(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
