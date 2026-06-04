// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/presentation/widgets/app_loader.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:yaki_ui/button.dart';
import 'package:yaki_ui/input_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submitLogin() async {
    final user = XpehoUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    await _connexionLoading(
      context: context,
      user: user,
      ref: ref,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loaderState = ref.watch(loaderStateProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
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
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      readOnly: false,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
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
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      readOnly: false,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submitLogin(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    text: 'Se connecter',
                    color: kDefaultXpehoColor,
                    onPressed: _submitLogin,
                  ),
                ],
              ),
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

  Future<void> _connexionLoading({
    required BuildContext context,
    required XpehoUser user,
    required WidgetRef ref,
  }) async {
    // Activez le loader ici
    ref.read(loaderStateProvider.notifier).showLoader();

    try {
      await ref.read(userProvider.notifier).tryToLogin(user);

      // Désactivez le loader après la connexion réussie
      ref.read(loaderStateProvider.notifier).hideLoader();

      // Naviguez vers la page d'accueil en réinitialisant le menu
      ref.read(menuSelectedProvider.notifier).reset();
      context.go('/home');
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
