// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/env/extensions/user.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userConnectedProvider);

    return Scaffold(
      backgroundColor: kDefaultBackgroudColor,
      appBar: AppBar(
        backgroundColor: kDefaultBackgroudColor,
        // Disconnect button in the app bar
        leading: IconButton(
          onPressed: () async {
            await ref.read(loginProvider).signOut();
            // Go to login page
            Navigator.pushReplacementNamed(context, '/');
          },
          icon: const Icon(Icons.logout),
        ),
        title: const Text('XpeApp Admin'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue ${user!.getName()}',
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
                onPressed: () => Navigator.pushNamed(context, '/newsletters'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
