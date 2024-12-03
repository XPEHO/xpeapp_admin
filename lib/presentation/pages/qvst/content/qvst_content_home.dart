import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_campaign.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_responses.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_stats.dart';
import 'package:xpeapp_admin/presentation/pages/qvst/content/qvst_content_theme.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstContentMenu {
  final String title;
  final QvstMenu menu;

  QvstContentMenu({
    required this.title,
    required this.menu,
  });
}

class QvstContentHome extends ConsumerWidget {
  const QvstContentHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<QvstContentMenu> menus = [
      QvstContentMenu(
        title: 'Thèmes',
        menu: QvstMenu.theme,
      ),
      QvstContentMenu(
        title: 'Campagnes',
        menu: QvstMenu.campaign,
      ),
      QvstContentMenu(
        title: 'Référentiels',
        menu: QvstMenu.responses,
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Bienvenue dans la partie QVST',
          style: TextStyle(
            color: kDefaultXpehoColor,
            fontSize: 30,
            fontFamily: 'SF Pro Rounded',
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: menus.length,
                  itemBuilder: (context, index) {
                    QvstContentMenu menu = menus[index];
                    return InkWell(
                      onTap: () =>
                          ref.read(qvstMenuProvider.notifier).changeMenu(
                                menu.menu,
                              ),
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Text(
                          menu.title,
                          style: TextStyle(
                            color:
                                (ref.watch(qvstMenuProvider)?.menu == menu.menu)
                                    ? kDefaultXpehoColor
                                    : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: getContentOfQvst(ref),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getContentOfQvst(WidgetRef ref) {
    final menu = ref.watch(qvstMenuProvider);
    switch (menu?.menu) {
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
      default:
        return const SizedBox();
    }
  }
}
