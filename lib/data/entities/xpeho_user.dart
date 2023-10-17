import 'package:xpeapp_admin/data/enum/admin_access.dart';

class XpehoUser {
  final String? uid;
  final String? name;
  final String email;
  final String password;
  final String? image;
  final List<AdminAccess>? adminAccess;

  XpehoUser({
    this.uid,
    this.name,
    required this.email,
    required this.password,
    this.image,
    this.adminAccess,
  });

  factory XpehoUser.fromJson(Map<String, dynamic> json) {
    return XpehoUser(
      uid: json['uid'],
      name: json['name'],
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      image: json['image'],
      adminAccess: json['adminAccess'] != null
          ? List<AdminAccess>.from(
              json['adminAccess'].map(
                (x) => AdminAccess.values[x],
              ),
            )
          : null,
    );
  }
}
