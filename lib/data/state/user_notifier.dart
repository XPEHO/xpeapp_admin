import 'package:flutter_riverpod/legacy.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/data/state/repositories/login_repository.dart';

class UserNotifier extends StateNotifier<XpehoUser?> {
  final LoginRepository _loginRepository;

  UserNotifier(this._loginRepository) : super(null);

  Future<void> tryToLogin(XpehoUser userToTry) async {
    final user = await _loginRepository.usernamePasswordSignIn(userToTry);
    state = user;
  }

  Future<void> signOut() async {
    await _loginRepository.signOut();
    state = null;
  }
}
