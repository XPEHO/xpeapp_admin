import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/user_access_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/user_access_widget.dart';

void main() async {
  group(
    'user access widget ...',
    () {
      testWidgets(
        'accessList empty',
        (tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: UserAccessWidget(
                  accessList: [],
                  uidUser: '',
                  accessMap: {},
                ),
              ),
            ),
          );

          expect(find.byType(ListView), findsOneWidget);
          expect(find.byType(ListTile), findsNothing);
        },
      );

      testWidgets(
        'accessList not empty',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: UserAccessWidget(
                  accessList: [
                    UserAccessEntity(
                      idAccess: 'idAccess',
                      description: 'nameAccess',
                      name: 'nameAccess',
                    )
                  ],
                  accessMap: const {
                    'idAccess': true,
                  },
                  uidUser: '123',
                ),
              ),
            ),
          );

          expect(find.byType(ListView), findsOneWidget);
          expect(find.byType(ListTile), findsOneWidget);
          expect(find.byType(Switch), findsOneWidget);

          final switchWidget = find.byType(Switch).first;
          expect(tester.widget<Switch>(switchWidget).value, true);

          /*await tester.tap(switchWidget);
          await tester.pumpAndSettle();

          expect(tester.widget<Switch>(switchWidget).value, false);*/
        },
      );
    },
  );
}
