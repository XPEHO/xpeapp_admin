import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/service/admin_web_push_notification_service.dart';
import 'package:xpeapp_admin/data/service/messaging_wrapper.dart';

import 'admin_web_push_notification_service_test.mocks.dart';

@GenerateMocks([BackendApi, MessagingWrapper])
class _FakeRemoteMessage extends Fake implements RemoteMessage {}

void main() {
  late FakeFirebaseFirestore firestore;
  late MockBackendApi backendApi;
  late MockMessagingWrapper messaging;
  late StreamController<RemoteMessage> onMessageController;
  late StreamController<RemoteMessage> onMessageOpenedAppController;
  late StreamController<String> onTokenRefreshController;

  AdminWebPushNotificationService buildService({bool isWeb = true}) {
    return AdminWebPushNotificationService(
      firestore: firestore,
      backendApi: backendApi,
      messaging: messaging,
      isWeb: isWeb,
      readUserAgent: () => 'test-agent',
    );
  }

  HttpResponse<dynamic> okResponse() {
    return HttpResponse(
      {},
      Response(
        requestOptions:
            RequestOptions(path: '/notifications/admin-web/subscribe'),
        statusCode: 200,
      ),
    );
  }

  setUp(() {
    firestore = FakeFirebaseFirestore();
    backendApi = MockBackendApi();
    messaging = MockMessagingWrapper();
    onMessageController = StreamController<RemoteMessage>.broadcast();
    onMessageOpenedAppController = StreamController<RemoteMessage>.broadcast();
    onTokenRefreshController = StreamController<String>.broadcast();

    when(messaging.requestPermission())
        .thenAnswer((_) async => AuthorizationStatus.authorized);
    when(messaging.getToken(any)).thenAnswer((_) async => null);
    when(messaging.getInitialMessage()).thenAnswer((_) async => null);
    when(messaging.onMessage).thenAnswer((_) => onMessageController.stream);
    when(messaging.onMessageOpenedApp)
        .thenAnswer((_) => onMessageOpenedAppController.stream);
    when(messaging.onTokenRefresh)
        .thenAnswer((_) => onTokenRefreshController.stream);

    when(backendApi.subscribeAdminWebNotificationTopic(any, any))
        .thenAnswer((_) async => okResponse());
  });

  tearDown(() async {
    await onMessageController.close();
    await onMessageOpenedAppController.close();
    await onTokenRefreshController.close();
  });

  group('AdminWebPushNotificationService test', () {
    test('returns early when not running on web', () async {
      final service = buildService(isWeb: false);

      await service.initializeForAdmin(
        adminEmail: 'admin@xpeho.com',
        adminAuthToken: 'jwt-token',
        onForegroundMessage: (_) {},
        onMessageTap: (_) {},
      );

      final docs = await firestore.collection('admin_web_push_tokens').get();

      verifyNever(messaging.requestPermission());
      verifyNever(messaging.getToken(any));
      expect(docs.docs, isEmpty);
      verifyNever(backendApi.subscribeAdminWebNotificationTopic(any, any));
    });

    test('returns when permission is denied', () async {
      final service = buildService();
      when(messaging.requestPermission())
          .thenAnswer((_) async => AuthorizationStatus.denied);

      await service.initializeForAdmin(
        adminEmail: 'admin@xpeho.com',
        adminAuthToken: 'jwt-token',
        onForegroundMessage: (_) {},
        onMessageTap: (_) {},
      );

      final docs = await firestore.collection('admin_web_push_tokens').get();

      verify(messaging.requestPermission()).called(1);
      verifyNever(messaging.getToken(any));
      expect(docs.docs, isEmpty);
      verifyNever(backendApi.subscribeAdminWebNotificationTopic(any, any));
    });

    test('syncs token to firestore and backend when auth token is present',
        () async {
      final service = buildService();
      when(messaging.getToken(any)).thenAnswer((_) async => 'token-1');

      await service.initializeForAdmin(
        adminEmail: 'admin@xpeho.com',
        adminAuthToken: 'jwt-token',
        onForegroundMessage: (_) {},
        onMessageTap: (_) {},
      );

      final document = await firestore
          .collection('admin_web_push_tokens')
          .doc('token-1')
          .get();

      expect(document.exists, isTrue);
      expect(document.data()?['email'], 'admin@xpeho.com');
      expect(document.data()?['platform'], 'web');
      expect(document.data()?['topic'], 'admin_web_ideas');
      expect(document.data()?['userAgent'], 'test-agent');
      verify(backendApi.subscribeAdminWebNotificationTopic(
              'Bearer jwt-token', any))
          .called(1);
    });

    test('syncs token to firestore but not backend when auth token is null',
        () async {
      final service = buildService();
      when(messaging.getToken(any)).thenAnswer((_) async => 'token-no-auth');

      await service.initializeForAdmin(
        adminEmail: 'admin@xpeho.com',
        adminAuthToken: null,
        onForegroundMessage: (_) {},
        onMessageTap: (_) {},
      );

      final document = await firestore
          .collection('admin_web_push_tokens')
          .doc('token-no-auth')
          .get();

      expect(document.exists, isTrue);
      verifyNever(backendApi.subscribeAdminWebNotificationTopic(any, any));
    });

    test('attaches listeners once and handles token refresh', () async {
      final service = buildService();
      when(messaging.getToken(any)).thenAnswer((_) async => null);

      await service.initializeForAdmin(
        adminEmail: 'admin@xpeho.com',
        adminAuthToken: 'jwt-token',
        onForegroundMessage: (_) {},
        onMessageTap: (_) {},
      );

      await service.initializeForAdmin(
        adminEmail: 'admin@xpeho.com',
        adminAuthToken: 'jwt-token',
        onForegroundMessage: (_) {},
        onMessageTap: (_) {},
      );

      onTokenRefreshController.add('refresh-token');
      await pumpEventQueue();

      verify(backendApi.subscribeAdminWebNotificationTopic(
              'Bearer jwt-token', any))
          .called(1);

      final document = await firestore
          .collection('admin_web_push_tokens')
          .doc('refresh-token')
          .get();
      expect(document.exists, isTrue);
    });

    test('initial message triggers onMessageTap callback', () async {
      final service = buildService();
      when(messaging.requestPermission())
          .thenAnswer((_) async => AuthorizationStatus.provisional);
      when(messaging.getToken(any)).thenAnswer((_) async => null);
      when(messaging.getInitialMessage())
          .thenAnswer((_) async => _FakeRemoteMessage());
      var tapCount = 0;

      await service.initializeForAdmin(
        adminEmail: 'admin@xpeho.com',
        adminAuthToken: 'jwt-token',
        onForegroundMessage: (_) {},
        onMessageTap: (_) {
          tapCount += 1;
        },
      );

      await pumpEventQueue();
      expect(tapCount, 1);
    });

    test('dispose cancels listeners', () async {
      final service = buildService();
      when(messaging.getToken(any)).thenAnswer((_) async => null);

      await service.initializeForAdmin(
        adminEmail: 'admin@xpeho.com',
        adminAuthToken: 'jwt-token',
        onForegroundMessage: (_) {},
        onMessageTap: (_) {},
      );

      service.dispose();
      onTokenRefreshController.add('token-after-dispose');
      await pumpEventQueue();

      verifyNever(backendApi.subscribeAdminWebNotificationTopic(any, any));
    });
  });
}
