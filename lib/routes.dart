import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xpeapp_admin/data/entities/agenda/birthday_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_type_entity.dart';
import 'package:xpeapp_admin/data/entities/newsletter_entity.dart';
import 'package:xpeapp_admin/data/enum/crud_page_mode.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/agenda_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/birthday/birthday_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/events/event_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/types/types_add_or_edit_page.dart';
import 'package:xpeapp_admin/presentation/pages/auth_guard.dart';
import 'package:xpeapp_admin/presentation/pages/feature_flipping/feature_flipping_page.dart';
import 'package:xpeapp_admin/presentation/pages/home_page.dart';
import 'package:xpeapp_admin/presentation/pages/idea_box/idea_box_page.dart';
import 'package:xpeapp_admin/presentation/pages/last_connection_page.dart';
import 'package:xpeapp_admin/presentation/pages/login_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletter_add_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletter_detail_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletters_page.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/qvst_add_page.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/qvst_detail_page.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/qvst_page.dart';
import 'package:xpeapp_admin/providers.dart';

/// Provider pour le router go_router
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final loginRepo = ref.read(loginProvider);
      final isLoggedIn = loginRepo.isUserLoggedIn();
      final isLoginPage = state.matchedLocation == '/';

      // Si non connecté et pas sur la page de login, rediriger vers login
      if (!isLoggedIn && !isLoginPage) {
        return '/';
      }

      // Si connecté et sur la page de login, rediriger vers home
      if (isLoggedIn && isLoginPage) {
        return '/home';
      }

      return null;
    },
    routes: [
      // ============ AUTH ============
      GoRoute(
        path: '/',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),

      // ============ HOME ============
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const AuthGuard(child: HomePage()),
      ),

      // ============ NEWSLETTERS ============
      GoRoute(
        path: '/newsletters',
        name: 'newsletters',
        builder: (context, state) => const AuthGuard(child: NewslettersPage()),
      ),
      GoRoute(
        path: '/newsletter/detail/:id',
        name: 'newsletter-detail',
        builder: (context, state) => AuthGuard(
          child: NewsletterDetailPage(
            id: state.pathParameters['id'],
          ),
        ),
      ),
      GoRoute(
        path: '/newsletter/add',
        name: 'newsletter-add',
        builder: (context, state) => const AuthGuard(
          child: NewsletterAddOrEditPage(
            typePage: NewsletterTypePage.add,
          ),
        ),
      ),
      GoRoute(
        path: '/newsletter/edit',
        name: 'newsletter-edit',
        builder: (context, state) {
          final newsletter = state.extra as NewsletterEntity?;
          return AuthGuard(
            child: NewsletterAddOrEditPage(
              typePage: NewsletterTypePage.edit,
              newsletter: newsletter,
            ),
          );
        },
      ),

      // ============ FEATURE FLIPPING ============
      GoRoute(
        path: '/featureFlipping',
        name: 'feature-flipping',
        builder: (context, state) =>
            const AuthGuard(child: FeatureFlippingPage()),
      ),

      // ============ QVST ============
      GoRoute(
        path: '/qvst',
        name: 'qvst',
        builder: (context, state) => const AuthGuard(child: QvstPage()),
      ),
      GoRoute(
        path: '/qvst/detail/:id',
        name: 'qvst-detail',
        builder: (context, state) => AuthGuard(
          child: QvstDetailPage(
            id: state.pathParameters['id'] ?? '',
          ),
        ),
      ),
      GoRoute(
        path: '/qvst/add',
        name: 'qvst-add',
        builder: (context, state) => const AuthGuard(child: QvstAddPage()),
      ),

      // ============ AGENDA ============
      GoRoute(
        path: '/agenda',
        name: 'agenda',
        builder: (context, state) => const AuthGuard(child: AgendaPage()),
      ),
      // Events
      GoRoute(
        path: '/agenda/event/add',
        name: 'agenda-event-add',
        builder: (context, state) {
          final onDismissed = state.extra as VoidCallback? ?? () {};
          return AuthGuard(
            child: EventAddOrEditPage(
              pageMode: CrudPageMode.create,
              onDismissed: onDismissed,
            ),
          );
        },
      ),
      GoRoute(
        path: '/agenda/event/edit',
        name: 'agenda-event-edit',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          return AuthGuard(
            child: EventAddOrEditPage(
              pageMode: CrudPageMode.edit,
              event: args?['event'] as EventsEntity?,
              onDismissed: args?['onDismissed'] as VoidCallback? ?? () {},
            ),
          );
        },
      ),
      // Birthday
      GoRoute(
        path: '/agenda/birthday/add',
        name: 'agenda-birthday-add',
        builder: (context, state) {
          final onDismissed = state.extra as VoidCallback? ?? () {};
          return AuthGuard(
            child: BirthdayAddOrEditPage(
              pageMode: CrudPageMode.create,
              onDismissed: onDismissed,
            ),
          );
        },
      ),
      GoRoute(
        path: '/agenda/birthday/edit',
        name: 'agenda-birthday-edit',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          return AuthGuard(
            child: BirthdayAddOrEditPage(
              pageMode: CrudPageMode.edit,
              birthday: args?['birthday'] as BirthdayEntity?,
              onDismissed: args?['onDismissed'] as VoidCallback? ?? () {},
            ),
          );
        },
      ),
      // Types
      GoRoute(
        path: '/agenda/type/add',
        name: 'agenda-type-add',
        builder: (context, state) {
          final onDismissed = state.extra as VoidCallback? ?? () {};
          return AuthGuard(
            child: EventTypesAddOrEditPage(
              pageMode: CrudPageMode.create,
              onDismissed: onDismissed,
            ),
          );
        },
      ),
      GoRoute(
        path: '/agenda/type/edit',
        name: 'agenda-type-edit',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          return AuthGuard(
            child: EventTypesAddOrEditPage(
              pageMode: CrudPageMode.edit,
              eventType: args?['eventType'] as EventsTypeEntity?,
              onDismissed: args?['onDismissed'] as VoidCallback? ?? () {},
            ),
          );
        },
      ),

      // ============ IDEA BOX ============
      GoRoute(
        path: '/ideabox',
        name: 'idea-box',
        builder: (context, state) => const AuthGuard(child: IdeaBoxPage()),
      ),

      // ============ LAST CONNECTION ============
      GoRoute(
        path: '/lastConnection',
        name: 'last-connection',
        builder: (context, state) =>
            const AuthGuard(child: LastConnectionPage()),
      ),
    ],
  );
});
