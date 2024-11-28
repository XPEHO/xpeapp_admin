import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/presentation/pages/auth_guard.dart';
import 'package:xpeapp_admin/presentation/pages/feature_flipping/feature_flipping_page.dart';
import 'package:xpeapp_admin/presentation/pages/home_page.dart';
import 'package:xpeapp_admin/presentation/pages/login_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletter_add_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletter_detail_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletters_page.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/qvst_add_page.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/qvst_detail_page.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/qvst_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const LoginPage(),
  '/home': (context) => const AuthGuard(child: HomePage()),
  '/newsletters': (context) => const AuthGuard(
        child: NewslettersPage(),
      ),
  '/newsletter/detail': (context) => AuthGuard(
        child: NewsletterDetailPage(
          id: ModalRoute.of(context)?.settings.arguments as String?,
        ),
      ),
  '/newsletter/add': (context) => const AuthGuard(
        child: NewsletterAddOrEditPage(
          typePage: NewsletterTypePage.add,
        ),
      ),
  '/newsletter/edit': (context) => AuthGuard(
        child: NewsletterAddOrEditPage(
          typePage: NewsletterTypePage.edit,
          newsletter:
              ModalRoute.of(context)!.settings.arguments as NewsletterEntity?,
        ),
      ),
  '/featureFlipping': (context) =>
      const AuthGuard(child: FeatureFlippingPage()),
  '/qvst': (context) => const AuthGuard(child: QvstPage()),
  '/qvst/detail': (context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return AuthGuard(
      child: QvstDetailPage(
        id: args?['id'] as String? ?? '',
      ),
    );
  },
  '/qvst/add': (context) => const AuthGuard(
        child: QvstAddPage(),
      ),
};
