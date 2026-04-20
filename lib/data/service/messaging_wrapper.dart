import 'package:firebase_messaging/firebase_messaging.dart';

abstract class MessagingWrapper {
  Future<AuthorizationStatus> requestPermission();
  Future<String?> getToken(String? vapidKey);
  Future<RemoteMessage?> getInitialMessage();
  Stream<RemoteMessage> get onMessage;
  Stream<RemoteMessage> get onMessageOpenedApp;
  Stream<String> get onTokenRefresh;
}

class FirebaseMessagingWrapper implements MessagingWrapper {
  final FirebaseMessaging _messaging;

  FirebaseMessagingWrapper(this._messaging);

  @override
  Future<AuthorizationStatus> requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );

    return settings.authorizationStatus;
  }

  @override
  Future<String?> getToken(String? vapidKey) {
    return _messaging.getToken(vapidKey: vapidKey);
  }

  @override
  Future<RemoteMessage?> getInitialMessage() {
    return _messaging.getInitialMessage();
  }

  @override
  Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;

  @override
  Stream<RemoteMessage> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp;

  @override
  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;
}
