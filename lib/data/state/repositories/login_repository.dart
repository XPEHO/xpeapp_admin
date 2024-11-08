import 'package:xpeapp_admin/data/entities/xpeho_user.dart';

abstract class LoginRepository {
  XpehoUser? get user;

  bool isUserLoggedIn();

  Future<void> usernamePasswordSignIn(XpehoUser user);

  Future<void> signOut();
}
