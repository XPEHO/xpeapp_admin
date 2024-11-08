import 'package:xpeapp_admin/data/entities/token.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';

class XpehoUser {
  String? email;
  String? password;
  Token? token;
  String? image;
  List<AdminAccess>? adminAccess;

  XpehoUser({
    this.email,
    this.password,
    this.token,
    this.image,
    this.adminAccess,
  });

  factory XpehoUser.fromFirebase(Map<String, dynamic> json) {
    return XpehoUser(
      image: json['image'] as String?,
      adminAccess: json['adminAccess'] != null
          ? (json['adminAccess'] as List<dynamic>)
              .map((e) => AdminAccess.values.firstWhere(
                    (element) => element.toString() == 'AdminAccess.$e',
                  ))
              .toList()
          : null,
    );
  }
}
