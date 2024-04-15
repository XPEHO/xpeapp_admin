import 'package:xpeapp_admin/data/entities/xpeho_user.dart';

abstract class LoginRepository {
  Future<void> googleSignIn();
  Future<void> usernamePasswordSignIn(XpehoUser user);

  Future<void> signOut();
}
