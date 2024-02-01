// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/presentation/widgets/app_loader.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';
import 'package:yaki_ui/input_text.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loaderState = ref.watch(loaderStateProvider);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: ListView(
              shrinkWrap: true,
              children: [
                Image.asset(
                  'assets/images/xpeho_logo.jpg',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: InputText(
                    type: InputTextType.email,
                    label: 'Adresse email',
                    controller: emailController,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: InputText(
                    type: InputTextType.password,
                    label: 'Mot de passe',
                    controller: passwordController,
                  ),
                ),
                const SizedBox(height: 20),
                Button(
                  text: 'Se connecter',
                  color: kDefaultXpehoColor,
                  onPressed: () async {
                    final user = XpehoUser(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    await _connexionLoading(
                      context: context,
                      user: user,
                      ref: ref,
                    );
                  },
                ),
              ],
            ),
          ),
          if (loaderState)
            const Center(
              child: AppLoader(
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }

  _connexionLoading({
    required BuildContext context,
    required XpehoUser user,
    required WidgetRef ref,
  }) async {
    final loginRepo = ref.read(loginProvider);
    // Activez le loader ici
    ref.read(loaderStateProvider.notifier).showLoader();

    try {
      await loginRepo.signIn(user);

      // Désactivez le loader après la connexion réussie
      ref.read(loaderStateProvider.notifier).hideLoader();

      Navigator.pushNamed(
        context,
        '/home',
      );
    } catch (error) {
      // En cas d'erreur, désactivez également le loader
      ref.read(loaderStateProvider.notifier).hideLoader();

      // Affichez le message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    }
  }
}
