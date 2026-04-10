import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xpeapp_admin/data/service/admin_users_service.dart';
import 'package:xpeapp_admin/data/service/admin_web_push_notification_service.dart';
import 'package:xpeapp_admin/data/service/config_service.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:xpeapp_admin/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Firebase with configuration
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final configService = ConfigService();
  final configuration = await configService.initConfig();
  final adminUsersService = AdminUsersService();
  final adminUsers = await adminUsersService.initAdminUsers();

  runApp(
    ProviderScope(
      overrides: [
        configProvider.overrideWithValue(configuration),
        adminProvider.overrideWithValue(adminUsers),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  late final AdminWebPushNotificationService _pushService;
  String? _initializedPushForEmail;

  @override
  void initState() {
    super.initState();
    _pushService = AdminWebPushNotificationService(
      FirebaseMessaging.instance,
      ref.read(cloudFirestoreProvider),
    );
  }

  Future<void> _initializeWebPushIfNeeded(
    XpehoUser? user,
    GoRouter router,
  ) async {
    final email = user?.email;

    if (email == null || email.isEmpty) {
      _initializedPushForEmail = null;
      return;
    }

    if (_initializedPushForEmail == email) {
      return;
    }

    _initializedPushForEmail = email;

    try {
      await _pushService.initializeForAdmin(
        adminEmail: email,
        vapidKey: ref.read(configProvider).firebaseWebPushVapidKey,
        onForegroundMessage: (message) {
          final title = message.notification?.title ?? 'Nouvelle idée';
          final body =
              message.notification?.body ?? 'Une nouvelle idée a été soumise';
          _scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(
              content: Text('$title\n$body'),
              action: SnackBarAction(
                label: 'Voir',
                onPressed: () => _openIdeaBox(router),
              ),
            ),
          );
        },
        onMessageTap: (message) {
          if (_isIdeaNotification(message)) {
            _openIdeaBox(router);
          }
        },
      );
    } catch (_) {
      _initializedPushForEmail = null;
    }
  }

  bool _isIdeaNotification(RemoteMessage message) {
    final type = message.data['type']?.toString();
    final target = message.data['target']?.toString();
    final route = message.data['route']?.toString();
    final title = message.notification?.title?.toLowerCase() ?? '';

    return type == 'idea_submission' ||
        target == 'idea_box' ||
        route == '/ideabox' ||
        title.contains('idée') ||
        title.contains('idee');
  }

  void _openIdeaBox(GoRouter router) {
    ref.read(menuSelectedProvider.notifier).setMenu(
        ref.read(listOfMenuProvider).firstWhere((m) => m.id == menuIdeaBox));
    router.go('/ideabox');
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final user = ref.watch(userProvider);
    _initializeWebPushIfNeeded(user, router);

    return MaterialApp.router(
      scaffoldMessengerKey: _scaffoldMessengerKey,
      title: 'XpeApp Admin',
      locale: const Locale('fr'),
      supportedLocales: const [
        Locale('fr'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
