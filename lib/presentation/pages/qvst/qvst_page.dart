import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_campaign.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_home.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_responses.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_stats.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_theme.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/widgets/qvst_themes_list_widget.dart';
import 'package:xpeapp_admin/presentation/widgets/user_profile_widget.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstPage extends ConsumerStatefulWidget {
  const QvstPage({super.key});

  @override
  ConsumerState<QvstPage> createState() => _QvstPageState();
}

class _QvstPageState extends ConsumerState<QvstPage> {
  bool themeWidgetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: kDefaultXpehoColor,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(
                            Icons.home,
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
                      drawerText(
                        text: 'Thèmes',
                        onPressed: () {
                          setState(() {
                            themeWidgetVisible = !themeWidgetVisible;
                          });
                        },
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: themeWidgetVisible ? 400 : 0,
                        child: const QvstThemesListWidget(),
                      ),
                      const SizedBox(height: 20),
                      drawerText(
                        text: 'Campagnes',
                        onPressed: () =>
                            ref.read(qvstMenuProvider.notifier).changeMenu(
                                  QvstMenu.campaign,
                                ),
                      ),
                      const SizedBox(height: 20),
                      drawerText(
                        text: 'Stats',
                        onPressed: () =>
                            ref.read(qvstMenuProvider.notifier).changeMenu(
                                  QvstMenu.stats,
                                ),
                      ),
                      const SizedBox(height: 20),
                      drawerText(
                        text: 'Réponses',
                        onPressed: () =>
                            ref.read(qvstMenuProvider.notifier).changeMenu(
                                  QvstMenu.responses,
                                ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Positioned(
                    bottom: 0,
                    child: UserProfileWidget(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: getContentOfQvst(ref),
          ),
        ],
      ),
    );
  }

  Widget drawerText({
    required String text,
    required Function() onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'SF Pro Rounded',
        ),
      ),
    );
  }

  Widget getContentOfQvst(WidgetRef ref) {
    final menu = ref.watch(qvstMenuProvider);
    switch (menu?.menu) {
      case null:
        return const QvstContentHome();
      case QvstMenu.theme:
        return QvstContentTheme(
          id: ref.watch(qvstMenuProvider)?.id,
        );
      case QvstMenu.campaign:
        return const QvstContentCampaign();
      case QvstMenu.stats:
        return QvstContentStats(
          campaignId: menu?.id ?? '',
        );
      case QvstMenu.responses:
        return const QvstContentResponses();
    }
  }
}
