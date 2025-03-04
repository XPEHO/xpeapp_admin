import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/menu_entity.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/agenda_page.dart';
import 'package:xpeapp_admin/presentation/pages/feature_flipping/feature_flipping_page.dart';
import 'package:xpeapp_admin/presentation/pages/newsletters/newsletters_page.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_home.dart';
import 'package:xpeapp_admin/presentation/widgets/user_profile_widget.dart';
import 'package:xpeapp_admin/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menus = ref.watch(listOfMenuProvider);
    final menuSelected = ref.watch(menuSelectedProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      // Floating action button in function of menu selected
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _getFloatingActionButton(
        menuSelected,
        context,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: kDefaultXpehoColor,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () => {
                        // Sign out
                        ref.watch(loginProvider).signOut(),
                        // Redirect to login page
                        Navigator.pushNamed(context, '/')
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/xpeapp.png',
                    width: 200,
                    height: 200,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: menus.length,
                      itemBuilder: (context, index) {
                        final menu = menus[index];
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (menuSelected?.id == menu.id)
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            onTap: () {
                              ref
                                  .read(menuSelectedProvider.notifier)
                                  .setMenu(menu);
                            },
                            title: Text(
                              menu.title,
                              style: TextStyle(
                                color: (menuSelected?.id == menu.id)
                                    ? kDefaultXpehoColor
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            leading: Icon(
                              menu.asset,
                              color: (menuSelected?.id == menu.id)
                                  ? kDefaultXpehoColor
                                  : Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  const UserProfileWidget(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.all(
                20,
              ),
              child: getWidgetFromMenuSelected(
                menuSelected,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getWidgetFromMenuSelected(
    MenuEntity? menuSelected,
  ) {
    if (menuSelected == null) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Bienvenue sur XPEHO',
            style: TextStyle(
              color: kDefaultXpehoColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/xpeho_logo.jpg',
            width: 300,
            height: 300,
          ),
        ],
      );
    } else {
      switch (menuSelected.id) {
        case 1:
          return const NewslettersPage();
        case 2:
          return const FeatureFlippingPage();
        case 3:
          return const QvstContentHome();
        case 4:
          return const AgendaPage();
        default:
          return const SizedBox();
      }
    }
  }

  Widget? _getFloatingActionButton(
      MenuEntity? menuSelected, BuildContext context) {
    if (menuSelected == null ||
        menuSelected.id == menuFeatureFlipping ||
        menuSelected.id == menuQvst ||
        menuSelected.id == menuAgenda) {
      return null;
    }

    return Tooltip(
      message: 'Ajouter une newsletter',
      child: FloatingActionButton(
        backgroundColor: kDefaultXpehoColor,
        onPressed: () {
          switch (menuSelected.id) {
            case menuNewsletter:
              Navigator.pushNamed(context, '/newsletter/add');
              break;
            default:
              break;
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
