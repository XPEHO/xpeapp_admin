// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';
import 'package:xpeapp_admin/env/extensions/user.dart';
import 'package:xpeapp_admin/presentation/pages/template/scaffold_template.dart';
import 'package:xpeapp_admin/presentation/widgets/picture_profile.dart';
import 'package:xpeapp_admin/presentation/widgets/widget_access.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userConnectedProvider);

    return ScaffoldTemplate(
      appBarTitle: 'XpeApp Admin',
      appBarLeading: IconButton(
        onPressed: () async {
          await ref.read(loginProvider).signOut();
          // Go to the / route and deconnect the user
          Navigator.popAndPushNamed(context, '/');
        },
        icon: const Icon(Icons.logout),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PictureProfile(
              uid: user?.uid,
              size: 200,
            ),
            const SizedBox(height: 20),
            if (user != null)
              Text(
                'Bienvenue ${user.getName()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Button.secondary(
                text: 'Newsletters',
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/newsletters',
                  arguments: user?.uid,
                ),
              ),
            ),
            const SizedBox(height: 20),
            WidgetAccess(
              haveAccess: AdminAccess.updateAccess,
              uidUser: user?.uid ?? '',
              authorizedWidget: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Button.secondary(
                  text: 'Droits d\'accès',
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/access',
                    arguments: user?.uid,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            WidgetAccess(
              haveAccess: AdminAccess.wordpressUsers,
              uidUser: user?.uid ?? '',
              authorizedWidget: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Button.secondary(
                  text: 'Utilisateurs Wordpress',
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/users',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
