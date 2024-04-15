import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/data/state/repositories/impl/login_repository_impl.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([FirebaseAuth, User, UserCredential])
void main() {
  group('LoginRepositoryImpl', () {
    late LoginRepositoryImpl loginRepository;
    late MockFirebaseAuth mockFirebaseAuth;
    late MockUser mockUser;

    setUpAll(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockUser = MockUser();
      loginRepository = LoginRepositoryImpl(
        mockFirebaseAuth,
      );
    });

    test('usernamePasswordSignIn should sign in with email and password',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password';
      final user = XpehoUser(email: email, password: password);

      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).thenAnswer((_) async {
        final userCredential = MockUserCredential();
        when(userCredential.user).thenReturn(mockUser);
        return Future.value(userCredential);
      });

      // Act
      await loginRepository.usernamePasswordSignIn(user);

      // Assert
      verify(mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).called(1);
    });

    test('usernamePasswordSignIn should throw an exception for invalid email',
        () async {
      // Arrange
      const email = 'invalid-email';
      const password = 'password';
      final user = XpehoUser(email: email, password: password);
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).thenThrow(FirebaseAuthException(code: 'invalid-email'));

      // Act & Assert
      expect(
          () => loginRepository.usernamePasswordSignIn(user), throwsException);
    });

    test('usernamePasswordSignIn should throw an exception for user not found',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password';
      final user = XpehoUser(email: email, password: password);
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).thenThrow(FirebaseAuthException(code: 'user-not-found'));

      // Act & Assert
      expect(
          () => loginRepository.usernamePasswordSignIn(user), throwsException);
    });

    test('usernamePasswordSignIn should throw an exception for wrong password',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'wrong-password';
      final user = XpehoUser(email: email, password: password);
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).thenThrow(FirebaseAuthException(code: 'wrong-password'));

      // Act & Assert
      expect(
          () => loginRepository.usernamePasswordSignIn(user), throwsException);
    });

    test('usernamePasswordSignIn should throw an exception for other errors',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password';
      final user = XpehoUser(email: email, password: password);
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )).thenThrow(FirebaseAuthException(code: 'other-error'));

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
    });

    test('authStateChange should call authStateChanges', () async {
      // Arrange
      when(mockFirebaseAuth.authStateChanges()).thenAnswer(
        (_) => Stream.value(mockUser),
      );

      // Act
      final stream = loginRepository.authStateChange;

      // Assert
      expect(stream, emits(mockUser));
      verify(mockFirebaseAuth.authStateChanges()).called(1);
    });
  });
}
