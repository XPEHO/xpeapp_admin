import 'package:firebase_auth/firebase_auth.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/data/state/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChange => _auth.authStateChanges();

  LoginRepositoryImpl();
  @override
  Future<void> signIn(XpehoUser user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw Exception('Email invalide.');
        case 'user-not-found':
          throw Exception('Aucun utilisateur trouvé avec cet email.');
        case 'wrong-password':
          throw Exception('Mot de passe incorrect.');
        default:
          throw Exception('Une erreur est survenue.');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
