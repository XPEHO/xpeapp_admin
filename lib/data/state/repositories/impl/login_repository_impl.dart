import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/data/state/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final FirebaseAuth auth;

  Stream<User?> get authStateChange => auth.authStateChanges();

  LoginRepositoryImpl(this.auth);

  /// Sign in with google, calls the platform specific google authentication
  /// UI. If the user cancels the operation, an [Exception] is thrown.
  /// If an error occurs during the operation, a [FirebaseAuthException] is thrown.
  @override
  Future<void> googleSignIn() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');

      try {
        await FirebaseAuth.instance.signInWithPopup(googleProvider);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'popup-closed-by-user') {
          // this exception occurs a few seconds after a popup has been closed
          throw Exception('Connexion annulée.');
        }
        if (e.code == 'cancelled-popup-request') {
          // this exception occurs when a new popup is open while
          // the last one still wasn't cancelled (even if it was closed)
          throw Exception('connexion annulée');
        } else {
          rethrow;
        }
      }
    } else {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      try {
        await FirebaseAuth.instance.signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'account-exists-with-different-credential':
            throw Exception('Un compte existe déjà avec cette adresse email.');
          case 'invalid-credential':
            throw Exception('Les informations de connexion sont invalides.');
          case 'user-disabled':
            throw Exception('Cet utilisateur a été désactivé.');
          case 'user-not-found':
            throw Exception('Aucun utilisateur trouvé avec cet email.');
          case 'wrong-password':
            throw Exception('Mot de passe incorrect.');
          default:
            rethrow;
        }
      }
    }
  }

  @override
  Future<void> usernamePasswordSignIn(XpehoUser user) async {
    try {
      await auth.signInWithEmailAndPassword(
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
          throw Exception('Une erreur est survenue. ${e.code}; ${e.message}');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
