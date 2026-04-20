import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/service/messaging_wrapper.dart';
import 'package:universal_html/html.dart' as html;

class AdminWebPushNotificationService {
  static const String _topicName = 'admin_web_ideas';
  static const String _vapidKeyEnv = 'FIREBASE_WEB_PUSH_VAPID_KEY';

  final FirebaseFirestore _firestore;
  final BackendApi _backendApi;
  final MessagingWrapper _messaging;
  final String Function() _readUserAgent;
  final bool _isWeb;
  final List<StreamSubscription<dynamic>> _subscriptions = [];

  bool _listenersAttached = false;

  AdminWebPushNotificationService({
    required FirebaseFirestore firestore,
    required BackendApi backendApi,
    required MessagingWrapper messaging,
    String Function()? readUserAgent,
    bool isWeb = kIsWeb,
  })  : _firestore = firestore,
        _backendApi = backendApi,
        _messaging = messaging,
        _isWeb = isWeb,
        _readUserAgent =
            readUserAgent ?? (() => html.window.navigator.userAgent);

  Future<void> initializeForAdmin({
    required String? adminEmail,
    required String? adminAuthToken,
    required void Function(RemoteMessage message) onForegroundMessage,
    required void Function(RemoteMessage message) onMessageTap,
  }) async {
    if (!_isWeb || adminEmail == null || adminEmail.isEmpty) {
      return;
    }

    final authorizationStatus = await _messaging.requestPermission();

    if (authorizationStatus != AuthorizationStatus.authorized &&
        authorizationStatus != AuthorizationStatus.provisional) {
      return;
    }

    const vapidKey = String.fromEnvironment(_vapidKeyEnv, defaultValue: '');
    final token = await _messaging.getToken(vapidKey.isEmpty ? null : vapidKey);

    if (token != null && token.isNotEmpty) {
      await _syncToken(token, adminEmail, adminAuthToken);
    }

    _attachMessageListeners(
      adminEmail,
      adminAuthToken,
      onForegroundMessage,
      onMessageTap,
    );
  }

  void _attachMessageListeners(
    String email,
    String? authToken,
    void Function(RemoteMessage message) onForegroundMessage,
    void Function(RemoteMessage message) onMessageTap,
  ) {
    if (_listenersAttached) return;

    _listenersAttached = true;

    _subscriptions.add(_messaging.onMessage.listen(onForegroundMessage));

    _subscriptions.add(_messaging.onMessageOpenedApp.listen(onMessageTap));

    _messaging.getInitialMessage().then((message) {
      if (message != null) {
        onMessageTap(message);
      }
    }).catchError((_) {});

    _subscriptions.add(
      _messaging.onTokenRefresh.listen((newToken) {
        unawaited(_syncToken(newToken, email, authToken).catchError((_) {}));
      }),
    );
  }

  void dispose() {
    for (final subscription in _subscriptions) {
      unawaited(subscription.cancel());
    }

    _subscriptions.clear();
    _listenersAttached = false;
  }

  Future<void> _syncToken(
    String token,
    String adminEmail,
    String? adminAuthToken,
  ) async {
    await _upsertAdminWebToken(token, adminEmail);

    if (adminAuthToken == null || adminAuthToken.isEmpty) {
      return;
    }

    await _subscribeTokenToBackendTopic(token, adminEmail, adminAuthToken);
  }

  Future<void> _subscribeTokenToBackendTopic(
    String token,
    String adminEmail,
    String adminAuthToken,
  ) async {
    try {
      await _backendApi.subscribeAdminWebNotificationTopic(
        'Bearer $adminAuthToken',
        {
          'token': token,
          'topic': _topicName,
          'email': adminEmail,
          'platform': 'web',
          'app': 'admin',
        },
      );
    } catch (_) {
      // Ignore subscription errors to avoid blocking the app lifecycle.
    }
  }

  Future<void> _upsertAdminWebToken(String token, String adminEmail) async {
    final document = _firestore.collection('admin_web_push_tokens').doc(token);
    await document.set({
      'token': token,
      'email': adminEmail,
      'platform': 'web',
      'app': 'admin',
      'topic': _topicName,
      'userAgent': _readUserAgent(),
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
