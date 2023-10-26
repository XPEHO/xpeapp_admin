import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';

class WidgetAccess extends StatelessWidget {
  final Stream stream;
  final AdminAccess haveAccess;
  final Widget authorizedWidget;
  final Widget? unauthorizedWidget;

  const WidgetAccess({
    super.key,
    required this.stream,
    required this.haveAccess,
    required this.authorizedWidget,
    this.unauthorizedWidget,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
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
