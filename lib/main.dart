import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/firebase_options.dart';
import 'package:xpeapp_admin/presentation/pages/home_page.dart';
import 'package:xpeapp_admin/presentation/pages/login_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletter_detail_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Firebase with configuration
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
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
      },
    );
  }
}
