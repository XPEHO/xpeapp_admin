// Mocks generated by Mockito 5.4.5 from annotations
// in xpeapp_admin/test/data/state/repositories/impl/login_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:typed_data' as _i10;

import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart'
    as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    as _i3;
import 'package:firebase_core/firebase_core.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;
import 'package:xpeapp_admin/data/entities/admin_users.dart' as _i12;
import 'package:xpeapp_admin/data/entities/token.dart' as _i8;
import 'package:xpeapp_admin/data/service/auth_service.dart' as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFirebaseApp_0 extends _i1.SmartFake implements _i2.FirebaseApp {
  _FakeFirebaseApp_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeActionCodeInfo_1 extends _i1.SmartFake
    implements _i3.ActionCodeInfo {
  _FakeActionCodeInfo_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUserCredential_2 extends _i1.SmartFake
    implements _i4.UserCredential {
  _FakeUserCredential_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeConfirmationResult_3 extends _i1.SmartFake
    implements _i4.ConfirmationResult {
  _FakeConfirmationResult_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSettings_4 extends _i1.SmartFake implements _i5.Settings {
  _FakeSettings_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCollectionReference_5<T extends Object?> extends _i1.SmartFake
    implements _i6.CollectionReference<T> {
  _FakeCollectionReference_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWriteBatch_6 extends _i1.SmartFake implements _i6.WriteBatch {
  _FakeWriteBatch_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoadBundleTask_7 extends _i1.SmartFake
    implements _i6.LoadBundleTask {
  _FakeLoadBundleTask_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuerySnapshot_8<T1 extends Object?> extends _i1.SmartFake
    implements _i6.QuerySnapshot<T1> {
  _FakeQuerySnapshot_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuery_9<T extends Object?> extends _i1.SmartFake
    implements _i6.Query<T> {
  _FakeQuery_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDocumentReference_10<T extends Object?> extends _i1.SmartFake
    implements _i6.DocumentReference<T> {
  _FakeDocumentReference_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFuture_11<T1> extends _i1.SmartFake implements _i7.Future<T1> {
  _FakeFuture_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeToken_12 extends _i1.SmartFake implements _i8.Token {
  _FakeToken_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FirebaseAuth].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAuth extends _i1.Mock implements _i4.FirebaseAuth {
  MockFirebaseAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseApp get app => (super.noSuchMethod(
        Invocation.getter(#app),
        returnValue: _FakeFirebaseApp_0(
          this,
          Invocation.getter(#app),
        ),
      ) as _i2.FirebaseApp);

  @override
  set app(_i2.FirebaseApp? _app) => super.noSuchMethod(
        Invocation.setter(
          #app,
          _app,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set tenantId(String? tenantId) => super.noSuchMethod(
        Invocation.setter(
          #tenantId,
          tenantId,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set customAuthDomain(String? customAuthDomain) => super.noSuchMethod(
        Invocation.setter(
          #customAuthDomain,
          customAuthDomain,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Map<dynamic, dynamic> get pluginConstants => (super.noSuchMethod(
        Invocation.getter(#pluginConstants),
        returnValue: <dynamic, dynamic>{},
      ) as Map<dynamic, dynamic>);

  @override
  _i7.Future<void> useAuthEmulator(
    String? host,
    int? port, {
    bool? automaticHostMapping = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #useAuthEmulator,
          [
            host,
            port,
          ],
          {#automaticHostMapping: automaticHostMapping},
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> applyActionCode(String? code) => (super.noSuchMethod(
        Invocation.method(
          #applyActionCode,
          [code],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<_i3.ActionCodeInfo> checkActionCode(String? code) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkActionCode,
          [code],
        ),
        returnValue: _i7.Future<_i3.ActionCodeInfo>.value(_FakeActionCodeInfo_1(
          this,
          Invocation.method(
            #checkActionCode,
            [code],
          ),
        )),
      ) as _i7.Future<_i3.ActionCodeInfo>);

  @override
  _i7.Future<void> confirmPasswordReset({
    required String? code,
    required String? newPassword,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #confirmPasswordReset,
          [],
          {
            #code: code,
            #newPassword: newPassword,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<_i4.UserCredential> createUserWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUserWithEmailAndPassword,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i7.Future<_i4.UserCredential>.value(_FakeUserCredential_2(
          this,
          Invocation.method(
            #createUserWithEmailAndPassword,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i7.Future<_i4.UserCredential>);

  @override
  _i7.Future<List<String>> fetchSignInMethodsForEmail(String? email) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchSignInMethodsForEmail,
          [email],
        ),
        returnValue: _i7.Future<List<String>>.value(<String>[]),
      ) as _i7.Future<List<String>>);

  @override
  _i7.Future<_i4.UserCredential> getRedirectResult() => (super.noSuchMethod(
        Invocation.method(
          #getRedirectResult,
          [],
        ),
        returnValue: _i7.Future<_i4.UserCredential>.value(_FakeUserCredential_2(
          this,
          Invocation.method(
            #getRedirectResult,
            [],
          ),
        )),
      ) as _i7.Future<_i4.UserCredential>);

  @override
  bool isSignInWithEmailLink(String? emailLink) => (super.noSuchMethod(
        Invocation.method(
          #isSignInWithEmailLink,
          [emailLink],
        ),
        returnValue: false,
      ) as bool);

  @override
  _i7.Stream<_i4.User?> authStateChanges() => (super.noSuchMethod(
        Invocation.method(
          #authStateChanges,
          [],
        ),
        returnValue: _i7.Stream<_i4.User?>.empty(),
      ) as _i7.Stream<_i4.User?>);

  @override
  _i7.Stream<_i4.User?> idTokenChanges() => (super.noSuchMethod(
        Invocation.method(
          #idTokenChanges,
          [],
        ),
        returnValue: _i7.Stream<_i4.User?>.empty(),
      ) as _i7.Stream<_i4.User?>);

  @override
  _i7.Stream<_i4.User?> userChanges() => (super.noSuchMethod(
        Invocation.method(
          #userChanges,
          [],
        ),
        returnValue: _i7.Stream<_i4.User?>.empty(),
      ) as _i7.Stream<_i4.User?>);

  @override
  _i7.Future<void> sendPasswordResetEmail({
    required String? email,
    _i3.ActionCodeSettings? actionCodeSettings,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendPasswordResetEmail,
          [],
          {
            #email: email,
            #actionCodeSettings: actionCodeSettings,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> sendSignInLinkToEmail({
    required String? email,
    required _i3.ActionCodeSettings? actionCodeSettings,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendSignInLinkToEmail,
          [],
          {
            #email: email,
            #actionCodeSettings: actionCodeSettings,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> setLanguageCode(String? languageCode) => (super.noSuchMethod(
        Invocation.method(
          #setLanguageCode,
          [languageCode],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> setSettings({
    bool? appVerificationDisabledForTesting = false,
    String? userAccessGroup,
    String? phoneNumber,
    String? smsCode,
    bool? forceRecaptchaFlow,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setSettings,
          [],
          {
            #appVerificationDisabledForTesting:
                appVerificationDisabledForTesting,
            #userAccessGroup: userAccessGroup,
            #phoneNumber: phoneNumber,
            #smsCode: smsCode,
            #forceRecaptchaFlow: forceRecaptchaFlow,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> setPersistence(_i3.Persistence? persistence) =>
      (super.noSuchMethod(
        Invocation.method(
          #setPersistence,
          [persistence],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<_i4.UserCredential> signInAnonymously() => (super.noSuchMethod(
        Invocation.method(
          #signInAnonymously,
          [],
        ),
        returnValue: _i7.Future<_i4.UserCredential>.value(_FakeUserCredential_2(
          this,
          Invocation.method(
            #signInAnonymously,
            [],
          ),
        )),
      ) as _i7.Future<_i4.UserCredential>);

  @override
  _i7.Future<_i4.UserCredential> signInWithCredential(
          _i3.AuthCredential? credential) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithCredential,
          [credential],
        ),
        returnValue: _i7.Future<_i4.UserCredential>.value(_FakeUserCredential_2(
          this,
          Invocation.method(
            #signInWithCredential,
            [credential],
          ),
        )),
      ) as _i7.Future<_i4.UserCredential>);

  @override
  _i7.Future<_i4.UserCredential> signInWithCustomToken(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithCustomToken,
          [token],
        ),
        returnValue: _i7.Future<_i4.UserCredential>.value(_FakeUserCredential_2(
          this,
          Invocation.method(
            #signInWithCustomToken,
            [token],
          ),
        )),
      ) as _i7.Future<_i4.UserCredential>);

  @override
  _i7.Future<_i4.UserCredential> signInWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithEmailAndPassword,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i7.Future<_i4.UserCredential>.value(_FakeUserCredential_2(
          this,
          Invocation.method(
            #signInWithEmailAndPassword,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i7.Future<_i4.UserCredential>);

  @override
  _i7.Future<_i4.UserCredential> signInWithEmailLink({
    required String? email,
    required String? emailLink,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithEmailLink,
          [],
          {
            #email: email,
            #emailLink: emailLink,
          },
        ),
        returnValue: _i7.Future<_i4.UserCredential>.value(_FakeUserCredential_2(
          this,
          Invocation.method(
            #signInWithEmailLink,
            [],
            {
              #email: email,
              #emailLink: emailLink,
            },
          ),
        )),
      ) as _i7.Future<_i4.UserCredential>);

  @override
  _i7.Future<_i4.UserCredential> signInWithProvider(
          _i3.AuthProvider? provider) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithProvider,
          [provider],
        ),
        returnValue: _i7.Future<_i4.UserCredential>.value(_FakeUserCredential_2(
          this,
          Invocation.method(
            #signInWithProvider,
            [provider],
          ),
        )),
      ) as _i7.Future<_i4.UserCredential>);

  @override
  _i7.Future<_i4.ConfirmationResult> signInWithPhoneNumber(
    String? phoneNumber, [
    _i4.RecaptchaVerifier? verifier,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithPhoneNumber,
          [
            phoneNumber,
            verifier,
          ],
        ),
        returnValue:
            _i7.Future<_i4.ConfirmationResult>.value(_FakeConfirmationResult_3(
          this,
          Invocation.method(
            #signInWithPhoneNumber,
            [
              phoneNumber,
              verifier,
            ],
          ),
        )),
      ) as _i7.Future<_i4.ConfirmationResult>);

  @override
  _i7.Future<_i4.UserCredential> signInWithPopup(_i3.AuthProvider? provider) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithPopup,
          [provider],
        ),
        returnValue: _i7.Future<_i4.UserCredential>.value(_FakeUserCredential_2(
          this,
          Invocation.method(
            #signInWithPopup,
            [provider],
          ),
        )),
      ) as _i7.Future<_i4.UserCredential>);

  @override
  _i7.Future<void> signInWithRedirect(_i3.AuthProvider? provider) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithRedirect,
          [provider],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> signOut() => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<String> verifyPasswordResetCode(String? code) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyPasswordResetCode,
          [code],
        ),
        returnValue: _i7.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #verifyPasswordResetCode,
            [code],
          ),
        )),
      ) as _i7.Future<String>);

  @override
  _i7.Future<void> verifyPhoneNumber({
    String? phoneNumber,
    _i3.PhoneMultiFactorInfo? multiFactorInfo,
    required _i3.PhoneVerificationCompleted? verificationCompleted,
    required _i3.PhoneVerificationFailed? verificationFailed,
    required _i3.PhoneCodeSent? codeSent,
    required _i3.PhoneCodeAutoRetrievalTimeout? codeAutoRetrievalTimeout,
    String? autoRetrievedSmsCodeForTesting,
    Duration? timeout = const Duration(seconds: 30),
    int? forceResendingToken,
    _i3.MultiFactorSession? multiFactorSession,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyPhoneNumber,
          [],
          {
            #phoneNumber: phoneNumber,
            #multiFactorInfo: multiFactorInfo,
            #verificationCompleted: verificationCompleted,
            #verificationFailed: verificationFailed,
            #codeSent: codeSent,
            #codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
            #autoRetrievedSmsCodeForTesting: autoRetrievedSmsCodeForTesting,
            #timeout: timeout,
            #forceResendingToken: forceResendingToken,
            #multiFactorSession: multiFactorSession,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> revokeTokenWithAuthorizationCode(
          String? authorizationCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #revokeTokenWithAuthorizationCode,
          [authorizationCode],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [FirebaseFirestore].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseFirestore extends _i1.Mock implements _i6.FirebaseFirestore {
  MockFirebaseFirestore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseApp get app => (super.noSuchMethod(
        Invocation.getter(#app),
        returnValue: _FakeFirebaseApp_0(
          this,
          Invocation.getter(#app),
        ),
      ) as _i2.FirebaseApp);

  @override
  set app(_i2.FirebaseApp? _app) => super.noSuchMethod(
        Invocation.setter(
          #app,
          _app,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get databaseURL => (super.noSuchMethod(
        Invocation.getter(#databaseURL),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#databaseURL),
        ),
      ) as String);

  @override
  set databaseURL(String? _databaseURL) => super.noSuchMethod(
        Invocation.setter(
          #databaseURL,
          _databaseURL,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get databaseId => (super.noSuchMethod(
        Invocation.getter(#databaseId),
        returnValue: _i9.dummyValue<String>(
          this,
          Invocation.getter(#databaseId),
        ),
      ) as String);

  @override
  set databaseId(String? _databaseId) => super.noSuchMethod(
        Invocation.setter(
          #databaseId,
          _databaseId,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set settings(_i5.Settings? settings) => super.noSuchMethod(
        Invocation.setter(
          #settings,
          settings,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Settings get settings => (super.noSuchMethod(
        Invocation.getter(#settings),
        returnValue: _FakeSettings_4(
          this,
          Invocation.getter(#settings),
        ),
      ) as _i5.Settings);

  @override
  Map<dynamic, dynamic> get pluginConstants => (super.noSuchMethod(
        Invocation.getter(#pluginConstants),
        returnValue: <dynamic, dynamic>{},
      ) as Map<dynamic, dynamic>);

  @override
  _i6.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #collection,
          [collectionPath],
        ),
        returnValue: _FakeCollectionReference_5<Map<String, dynamic>>(
          this,
          Invocation.method(
            #collection,
            [collectionPath],
          ),
        ),
      ) as _i6.CollectionReference<Map<String, dynamic>>);

  @override
  _i6.WriteBatch batch() => (super.noSuchMethod(
        Invocation.method(
          #batch,
          [],
        ),
        returnValue: _FakeWriteBatch_6(
          this,
          Invocation.method(
            #batch,
            [],
          ),
        ),
      ) as _i6.WriteBatch);

  @override
  _i7.Future<void> clearPersistence() => (super.noSuchMethod(
        Invocation.method(
          #clearPersistence,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> enablePersistence(
          [_i5.PersistenceSettings? persistenceSettings]) =>
      (super.noSuchMethod(
        Invocation.method(
          #enablePersistence,
          [persistenceSettings],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i6.LoadBundleTask loadBundle(_i10.Uint8List? bundle) => (super.noSuchMethod(
        Invocation.method(
          #loadBundle,
          [bundle],
        ),
        returnValue: _FakeLoadBundleTask_7(
          this,
          Invocation.method(
            #loadBundle,
            [bundle],
          ),
        ),
      ) as _i6.LoadBundleTask);

  @override
  void useFirestoreEmulator(
    String? host,
    int? port, {
    bool? sslEnabled = false,
    bool? automaticHostMapping = true,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #useFirestoreEmulator,
          [
            host,
            port,
          ],
          {
            #sslEnabled: sslEnabled,
            #automaticHostMapping: automaticHostMapping,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Future<_i6.QuerySnapshot<T>> namedQueryWithConverterGet<T>(
    String? name, {
    _i5.GetOptions? options = const _i5.GetOptions(),
    required _i6.FromFirestore<T>? fromFirestore,
    required _i6.ToFirestore<T>? toFirestore,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #namedQueryWithConverterGet,
          [name],
          {
            #options: options,
            #fromFirestore: fromFirestore,
            #toFirestore: toFirestore,
          },
        ),
        returnValue:
            _i7.Future<_i6.QuerySnapshot<T>>.value(_FakeQuerySnapshot_8<T>(
          this,
          Invocation.method(
            #namedQueryWithConverterGet,
            [name],
            {
              #options: options,
              #fromFirestore: fromFirestore,
              #toFirestore: toFirestore,
            },
          ),
        )),
      ) as _i7.Future<_i6.QuerySnapshot<T>>);

  @override
  _i7.Future<_i6.QuerySnapshot<Map<String, dynamic>>> namedQueryGet(
    String? name, {
    _i5.GetOptions? options = const _i5.GetOptions(),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #namedQueryGet,
          [name],
          {#options: options},
        ),
        returnValue: _i7.Future<_i6.QuerySnapshot<Map<String, dynamic>>>.value(
            _FakeQuerySnapshot_8<Map<String, dynamic>>(
          this,
          Invocation.method(
            #namedQueryGet,
            [name],
            {#options: options},
          ),
        )),
      ) as _i7.Future<_i6.QuerySnapshot<Map<String, dynamic>>>);

  @override
  _i6.Query<Map<String, dynamic>> collectionGroup(String? collectionPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #collectionGroup,
          [collectionPath],
        ),
        returnValue: _FakeQuery_9<Map<String, dynamic>>(
          this,
          Invocation.method(
            #collectionGroup,
            [collectionPath],
          ),
        ),
      ) as _i6.Query<Map<String, dynamic>>);

  @override
  _i7.Future<void> disableNetwork() => (super.noSuchMethod(
        Invocation.method(
          #disableNetwork,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i6.DocumentReference<Map<String, dynamic>> doc(String? documentPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #doc,
          [documentPath],
        ),
        returnValue: _FakeDocumentReference_10<Map<String, dynamic>>(
          this,
          Invocation.method(
            #doc,
            [documentPath],
          ),
        ),
      ) as _i6.DocumentReference<Map<String, dynamic>>);

  @override
  _i7.Future<void> enableNetwork() => (super.noSuchMethod(
        Invocation.method(
          #enableNetwork,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Stream<void> snapshotsInSync() => (super.noSuchMethod(
        Invocation.method(
          #snapshotsInSync,
          [],
        ),
        returnValue: _i7.Stream<void>.empty(),
      ) as _i7.Stream<void>);

  @override
  _i7.Future<T> runTransaction<T>(
    _i6.TransactionHandler<T>? transactionHandler, {
    Duration? timeout = const Duration(seconds: 30),
    int? maxAttempts = 5,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #runTransaction,
          [transactionHandler],
          {
            #timeout: timeout,
            #maxAttempts: maxAttempts,
          },
        ),
        returnValue: _i9.ifNotNull(
              _i9.dummyValueOrNull<T>(
                this,
                Invocation.method(
                  #runTransaction,
                  [transactionHandler],
                  {
                    #timeout: timeout,
                    #maxAttempts: maxAttempts,
                  },
                ),
              ),
              (T v) => _i7.Future<T>.value(v),
            ) ??
            _FakeFuture_11<T>(
              this,
              Invocation.method(
                #runTransaction,
                [transactionHandler],
                {
                  #timeout: timeout,
                  #maxAttempts: maxAttempts,
                },
              ),
            ),
      ) as _i7.Future<T>);

  @override
  _i7.Future<void> terminate() => (super.noSuchMethod(
        Invocation.method(
          #terminate,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> waitForPendingWrites() => (super.noSuchMethod(
        Invocation.method(
          #waitForPendingWrites,
          [],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> setIndexConfiguration({
    required List<_i5.Index>? indexes,
    List<_i5.FieldOverrides>? fieldOverrides,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setIndexConfiguration,
          [],
          {
            #indexes: indexes,
            #fieldOverrides: fieldOverrides,
          },
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);

  @override
  _i7.Future<void> setIndexConfigurationFromJSON(String? json) =>
      (super.noSuchMethod(
        Invocation.method(
          #setIndexConfigurationFromJSON,
          [json],
        ),
        returnValue: _i7.Future<void>.value(),
        returnValueForMissingStub: _i7.Future<void>.value(),
      ) as _i7.Future<void>);
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i11.AuthService {
  MockAuthService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i8.Token> getToken(
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getToken,
          [
            username,
            password,
          ],
        ),
        returnValue: _i7.Future<_i8.Token>.value(_FakeToken_12(
          this,
          Invocation.method(
            #getToken,
            [
              username,
              password,
            ],
          ),
        )),
      ) as _i7.Future<_i8.Token>);
}

/// A class which mocks [AdminUsers].
///
/// See the documentation for Mockito's code generation for more information.
class MockAdminUsers extends _i1.Mock implements _i12.AdminUsers {
  MockAdminUsers() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<String> get users => (super.noSuchMethod(
        Invocation.getter(#users),
        returnValue: <String>[],
      ) as List<String>);

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [UserCredential].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserCredential extends _i1.Mock implements _i4.UserCredential {
  MockUserCredential() {
    _i1.throwOnMissingStub(this);
  }
}
