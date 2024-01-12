import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';
import 'package:xpeapp_admin/providers.dart';

class WidgetAccess extends ConsumerWidget {
  final AdminAccess haveAccess;
  final Widget authorizedWidget;
  final Widget? unauthorizedWidget;

  const WidgetAccess({
    super.key,
    required this.haveAccess,
    required this.authorizedWidget,
    this.unauthorizedWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userUid = ref.read(uidUserProvider);
    if (userUid.isEmpty) {
      return unauthorizedWidget ?? Container();
    } else {
      return StreamBuilder(
        stream: ref
            .watch(cloudFirestoreProvider)
            .collection('users')
            .doc(userUid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return const Icon(Icons.error);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final Map<AdminAccess, bool> data = Map<AdminAccess, bool>.from(
              (snapshot.data['access'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(
              AdminAccess.values.firstWhere(
                  (element) => element.toString() == 'AdminAccess.$key'),
              value,
            ),
          ));

          if (data[haveAccess] == true) {
            return authorizedWidget;
          } else {
            return unauthorizedWidget ?? const SizedBox();
          }
        },
      );
    }
  }
}
