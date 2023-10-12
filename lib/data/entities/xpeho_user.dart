import 'package:xpeapp_admin/data/enum/admin_access.dart';

class XpehoUser {
  final String? name;
  final String email;
  final String password;
  final String? image;
  final List<AdminAccess>? adminAccess;

  XpehoUser({
    this.name,
    required this.email,
    required this.password,
    this.image,
    this.adminAccess,
  });
}
