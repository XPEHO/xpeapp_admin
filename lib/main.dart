import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/data/service/config_service.dart';
import 'package:xpeapp_admin/firebase_options.dart';
import 'package:xpeapp_admin/presentation/pages/access/access_detail_page.dart';
import 'package:xpeapp_admin/presentation/pages/access/access_page.dart';
import 'package:xpeapp_admin/presentation/pages/home_page.dart';
import 'package:xpeapp_admin/presentation/pages/login_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletter_add_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletter_detail_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletters_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xpeapp_admin/presentation/pages/users/wordpress_users_page.dart';
import 'package:xpeapp_admin/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Firebase with configuration
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final configService = ConfigService();
  final configuration = await configService.initConfig();

  runApp(
    ProviderScope(
      overrides: [
        configProvider.overrideWithValue(configuration),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/newsletters': (context) => const NewslettersPage(),
        '/newsletter/detail': (context) => NewsletterDetailPage(
              id: ModalRoute.of(context)!.settings.arguments as String,
            ),
        '/newsletter/add': (context) => const NewsletterAddOrEditPage(
              typePage: NewsletterTypePage.add,
            ),
        '/newsletter/edit': (context) => NewsletterAddOrEditPage(
              typePage: NewsletterTypePage.edit,
              newsletter: ModalRoute.of(context)!.settings.arguments
                  as NewsletterEntity,
            ),
        '/access': (context) => const AccessPage(),
        '/access/detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return AccessDetailPage(
            id: args['id'] as String,
            nameOfAccessUser: args['nameOfAccessUser'] as String,
          );
        },
        '/users': (context) => const WordpressUsersPage(),
      },
    );
  }
}
