import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xpeapp_admin/data/entities/admin_users.dart';
import 'package:xpeapp_admin/data/entities/token.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/data/service/auth_service.dart';
import 'package:xpeapp_admin/data/state/repositories/impl/login_repository_impl.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks(
    [FirebaseAuth, FirebaseFirestore, AuthService, AdminUsers, UserCredential])
void main() {
  group('LoginRepositoryImpl', () {
    late LoginRepositoryImpl loginRepository;
    late MockFirebaseAuth mockFirebaseAuth;
    late MockFirebaseFirestore mockFirebaseFirestore;
    late MockAuthService mockAuthService;
    late MockAdminUsers mockAdminUsers;

    setUpAll(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirebaseFirestore = MockFirebaseFirestore();
      mockAuthService = MockAuthService();
      mockAdminUsers = MockAdminUsers();
      loginRepository = LoginRepositoryImpl(mockFirebaseAuth,
          mockFirebaseFirestore, mockAuthService, mockAdminUsers);
    });

    test('usernamePasswordSignIn should sign in with email and password',
        () async {
      // GIVEN
      const email = 'test@example.com';
      const password = 'password';
      final user = XpehoUser(email: email, password: password);
      final token = Token(
          token: 'token',
          email: email,
          nicename: 'nicename',
          displayName: 'displayName');

      when(mockFirebaseAuth.signInAnonymously())
          .thenAnswer((_) async => MockUserCredential());
      when(mockAdminUsers.users).thenReturn([email]);
      when(mockAuthService.getToken(email, password))
          .thenAnswer((_) async => token);

      // WHEN
      await loginRepository.usernamePasswordSignIn(user);

      // THEN
      expect(loginRepository.user?.email, email);
      expect(loginRepository.user?.token, token);
      verify(mockFirebaseAuth.signInAnonymously()).called(1);
      verify(mockAuthService.getToken(email, password)).called(1);
    });

    test(
        'usernamePasswordSignIn should throw an exception for missing email or password',
        () async {
      // GIVEN
      final user = XpehoUser(email: null, password: null);

      // WHEN & THEN
      expect(
          () => loginRepository.usernamePasswordSignIn(user), throwsException);
    });

    test('usernamePasswordSignIn should throw an exception for non-admin user',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password';
      final user = XpehoUser(email: email, password: password);

      when(mockFirebaseAuth.signInAnonymously())
          .thenAnswer((_) async => MockUserCredential());
      when(mockAdminUsers.users).thenReturn([]);

      // Act & Assert
      expect(
          () => loginRepository.usernamePasswordSignIn(user), throwsException);
    });

    test(
        'usernamePasswordSignIn should throw an exception for Firebase Auth error',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password';
      final user = XpehoUser(email: email, password: password);

      when(mockFirebaseAuth.signInAnonymously())
          .thenThrow(FirebaseAuthException(code: 'auth-error'));

      // Act & Assert
      expect(
          () => loginRepository.usernamePasswordSignIn(user), throwsException);
    });

    test(
        'usernamePasswordSignIn should throw an exception for Firebase Firestore error',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password';
      final user = XpehoUser(email: email, password: password);

      when(mockFirebaseAuth.signInAnonymously())
          .thenAnswer((_) async => MockUserCredential());
      when(mockAdminUsers.users)
          .thenThrow(FirebaseException(plugin: 'firestore'));

      // Act & Assert
      expect(
          () => loginRepository.usernamePasswordSignIn(user), throwsException);
    });

    test('signOut should sign out', () async {
      // Arrange
      when(mockFirebaseAuth.signOut()).thenAnswer((_) => Future.value());

      // Act
      await loginRepository.signOut();

      // Assert
      verify(mockFirebaseAuth.signOut()).called(1);
      expect(loginRepository.user, isNull);
    });
  });
}
