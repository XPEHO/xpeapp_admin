import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xpeapp_admin/data/entities/admin_users.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/data/service/auth_service.dart';
import 'package:xpeapp_admin/data/state/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final AuthService authService;
  final AdminUsers adminUsers;

  @override
  XpehoUser? user;

  LoginRepositoryImpl(
      this.auth, this.firestore, this.authService, this.adminUsers);

  @override
  bool isUserLoggedIn() {
    return user != null && user?.token != null;
  }

  @override
  Future<XpehoUser> usernamePasswordSignIn(XpehoUser userToSignIn) async {
    try {
      if (userToSignIn.email == null || userToSignIn.password == null) {
        throw Exception('Email and password are required');
      }

      // Login to firebase
      await auth.signInAnonymously();

      // Check user email is in config email list, that means it's an admin
      if (!adminUsers.users.contains(userToSignIn.email)) {
        throw Exception('User is not an admin');
      }

      // Login to wordpress
      user = userToSignIn;
      user!.token = await authService.getToken(
        userToSignIn.email!,
        userToSignIn.password!,
      );

      return user!;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth specific errors
      throw Exception('Firebase Auth Error: ${e.message}');
    } on FirebaseException catch (e) {
      // Handle Firebase Firestore specific errors
      throw Exception('Firebase Firestore Error: ${e.message}');
    } on Exception catch (e) {
      // Handle other exceptions
      throw Exception('Connection Error: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
    user = null;
  }
}
