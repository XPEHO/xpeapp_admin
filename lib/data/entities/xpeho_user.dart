import 'package:xpeapp_admin/data/entities/token.dart';

class XpehoUser {
  String? email;
  String? password;
  Token? token;
  String? image;

  XpehoUser({
    this.email,
    this.password,
    this.token,
    this.image,
  });

  factory XpehoUser.fromFirebase(Map<String, dynamic> json) {
    return XpehoUser(
      image: json['image'] as String?,
    );
  }
}
