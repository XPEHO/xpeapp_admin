import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';
import 'package:xpeapp_admin/presentation/widgets/widget_access.dart';

void main() {
  group('widget access ...', () {
    testWidgets('show authorized widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WidgetAccess(
              stream: Stream.value(
                {
                  'access': {
                    'vacation': true,
                  }
                },
              ),
              haveAccess: AdminAccess.vacation,
              authorizedWidget: const Text('authorized'),
              unauthorizedWidget: const Text('unauthorized'),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('authorized'), findsOneWidget);
      expect(find.text('unauthorized'), findsNothing);
    });

    testWidgets('show unauthorized widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WidgetAccess(
              stream: Stream.value(
                {
                  'access': {
                    'vacation': false,
                  }
                },
              ),
              haveAccess: AdminAccess.vacation,
              authorizedWidget: const Text('authorized'),
              unauthorizedWidget: const Text('unauthorized'),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('authorized'), findsNothing);
      expect(find.text('unauthorized'), findsOneWidget);
    });
  });
}
