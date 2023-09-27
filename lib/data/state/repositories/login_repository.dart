import 'package:xpeapp_admin/data/entities/xpeho_user.dart';

abstract class LoginRepository {
  Future<void> signIn(XpehoUser user);

  Future<void> signOut();
}
