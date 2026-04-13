import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

class AdminWebPushNotificationService {
  static const String _topicName = 'admin_web_ideas';

  final FirebaseMessaging _messaging;
  final FirebaseFirestore _firestore;

  bool _listenersAttached = false;

  AdminWebPushNotificationService(this._messaging, this._firestore);

  Future<void> initializeForAdmin({
    required String? adminEmail,
    required void Function(RemoteMessage message) onForegroundMessage,
    required void Function(RemoteMessage message) onMessageTap,
  }) async {
    if (!kIsWeb || (adminEmail == null || adminEmail.isEmpty)) {
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

    final token = await _messaging.getToken();

    if (token != null && token.isNotEmpty) {
      await _upsertAdminWebToken(token, adminEmail);
    }

    _attachMessageListeners(adminEmail, onForegroundMessage, onMessageTap);
  }

  void _attachMessageListeners(
    String adminEmail,
    void Function(RemoteMessage message) onForegroundMessage,
    void Function(RemoteMessage message) onMessageTap,
  ) {
    if (_listenersAttached) {
      return;
    }

    _listenersAttached = true;

    FirebaseMessaging.onMessage.listen(onForegroundMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(onMessageTap);

    _messaging.getInitialMessage().then((message) {
      if (message != null) {
        onMessageTap(message);
      }
    });

    _messaging.onTokenRefresh.listen((newToken) async {
      await _upsertAdminWebToken(newToken, adminEmail);
    });
  }

  Future<void> _upsertAdminWebToken(String token, String adminEmail) async {
    final collection = _firestore.collection('admin_web_push_tokens');
    final existing =
        await collection.where('token', isEqualTo: token).limit(1).get();

    final payload = <String, dynamic>{
      'token': token,
      'email': adminEmail,
      'platform': 'web',
      'app': 'admin',
      'topic': _topicName,
      'userAgent': html.window.navigator.userAgent,
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (existing.docs.isEmpty) {
      payload['createdAt'] = FieldValue.serverTimestamp();
      await collection.add(payload);
      return;
    }

    await existing.docs.first.reference.set(payload, SetOptions(merge: true));
  }
}
