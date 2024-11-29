import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/providers.dart';

class AuthGuard extends ConsumerWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Login providers
    final loginRepo = ref.watch(loginProvider);
    final isConnected = loginRepo.isUserLoggedIn();

    if (!isConnected) {
      // Redirect to login page if not authenticated and sign out
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(userProvider.notifier).signOut();
        Navigator.pushReplacementNamed(context, '/');
      });

      // Clear QVST menu
      ref.read(qvstMenuProvider.notifier).clearMenu();
      // Clear Menu
      ref.read(menuSelectedProvider.notifier).reset();

      return const SizedBox.shrink();
    } else {
      return child;
    }
  }
}
