import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';
import 'package:xpeapp_admin/presentation/widgets/widget_access.dart';
import 'package:xpeapp_admin/providers.dart';

void main() {
  group('widget access ...', () {
    testWidgets('show authorized widget', (tester) async {
      final fakeFirestore = FakeFirebaseFirestore();
      await fakeFirestore.collection('users').add({'uid': 'uid'});
      await fakeFirestore.collection('users').doc('uid').set({
        'access': {
          'vacation': true,
        },
      });

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            uidUserProvider.overrideWithValue('uid'),
            cloudFirestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: WidgetAccess(
                haveAccess: AdminAccess.vacation,
                authorizedWidget: Text('authorized'),
                unauthorizedWidget: Text('unauthorized'),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      expect(find.text('authorized'), findsOneWidget);
      expect(find.text('unauthorized'), findsNothing);
    });

    testWidgets('show unauthorized widget', (tester) async {
      final fakeFirestore = FakeFirebaseFirestore();
      await fakeFirestore.collection('users').add({'uid': 'uid'});
      await fakeFirestore.collection('users').doc('uid').set({
        'access': {
          'vacation': false,
        },
      });
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            uidUserProvider.overrideWithValue('uid'),
            cloudFirestoreProvider.overrideWithValue(fakeFirestore),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: WidgetAccess(
                haveAccess: AdminAccess.vacation,
                authorizedWidget: Text('authorized'),
                unauthorizedWidget: Text('unauthorized'),
              ),
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
