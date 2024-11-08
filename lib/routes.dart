import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/presentation/pages/access/feature_flipping_page.dart';
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
        newsletter:
            ModalRoute.of(context)!.settings.arguments as NewsletterEntity,
      ),
  '/featureFlipping': (context) => const FeatureFlippingPage(),
  '/qvst': (context) => const QvstPage(),
  '/qvst/detail': (context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return QvstDetailPage(
      id: args?['id'] as String? ?? '',
    );
  },
  '/qvst/add': (context) => const QvstAddPage(),
};
