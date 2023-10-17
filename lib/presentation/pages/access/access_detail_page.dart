import 'package:flutter/material.dart';
import 'package:xpeapp_admin/presentation/widgets/user_access_widget.dart';

class AccessDetailPage extends StatelessWidget {
  final String id;
  final String nameOfAccessUser;

  const AccessDetailPage({
    super.key,
    required this.id,
    required this.nameOfAccessUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accès de $nameOfAccessUser'),
      ),
      body: UserAccessWidget(
        uidUser: id,
      ),
    );
  }
}
