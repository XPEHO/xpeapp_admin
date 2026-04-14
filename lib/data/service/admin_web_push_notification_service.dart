import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:universal_html/html.dart' as html;

class AdminWebPushNotificationService {
  static const String _topicName = 'admin_web_ideas';
  static const String _webPushVapidKey = String.fromEnvironment(
    'FIREBASE_WEB_PUSH_VAPID_KEY',
    defaultValue: '',
  );

  final FirebaseMessaging _messaging;
  final FirebaseFirestore _firestore;
  final BackendApi _backendApi;

  bool _listenersAttached = false;

  AdminWebPushNotificationService(
    this._messaging,
    this._firestore,
    this._backendApi,
  );

  Future<void> initializeForAdmin({
    required String? adminEmail,
    required String? adminAuthToken,
    required void Function(RemoteMessage message) onForegroundMessage,
    required void Function(RemoteMessage message) onMessageTap,
  }) async {
    if (!kIsWeb || adminEmail == null || adminEmail.isEmpty) {
      return;
    }

    final permission = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );

    if (permission.authorizationStatus != AuthorizationStatus.authorized &&
        permission.authorizationStatus != AuthorizationStatus.provisional) {
      return;
    }

    final token = await _messaging.getToken(
      vapidKey: _webPushVapidKey.isEmpty ? null : _webPushVapidKey,
    );

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
    String adminEmail,
    String? adminAuthToken,
    void Function(RemoteMessage message) onForegroundMessage,
    void Function(RemoteMessage message) onMessageTap,
  ) {
    if (_listenersAttached) return;

    _listenersAttached = true;

    FirebaseMessaging.onMessage.listen(onForegroundMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(onMessageTap);

    _messaging.getInitialMessage().then((message) {
      if (message != null) {
        onMessageTap(message);
      }
    });

    _messaging.onTokenRefresh.listen((newToken) async {
      await _syncToken(newToken, adminEmail, adminAuthToken);
    });
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
    final existing = await document.get();

    final payload = <String, dynamic>{
      'token': token,
      'email': adminEmail,
      'platform': 'web',
      'app': 'admin',
      'topic': _topicName,
      'userAgent': html.window.navigator.userAgent,
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (!existing.exists) {
      payload['createdAt'] = FieldValue.serverTimestamp();
    }

    await document.set(payload, SetOptions(merge: true));
  }
}
