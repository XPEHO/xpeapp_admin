import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/agenda_menu.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/content/birthday/agenda_content_birthday.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/content/events/agenda_content_events.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/content/types/agenda_content_types.dart';
import 'package:xpeapp_admin/providers.dart';

class AgendaContentMenu {
  final String title;
  final AgendaMenu menu;

  AgendaContentMenu({
    required this.title,
    required this.menu,
  });
}

class AgendaPage extends ConsumerStatefulWidget {
  const AgendaPage({
    super.key,
  });

  @override
  AgendaPageState createState() => AgendaPageState();
}

class AgendaPageState extends ConsumerState<AgendaPage> {
  @override
  Widget build(BuildContext context) {
    List<AgendaContentMenu> menus = [
      AgendaContentMenu(
        title: 'Événements',
        menu: AgendaMenu.events,
      ),
      AgendaContentMenu(
        title: 'Type',
        menu: AgendaMenu.types,
      ),
      AgendaContentMenu(
        title: 'Anniversaires',
        menu: AgendaMenu.birthdays,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context, index) {
                AgendaContentMenu menu = menus[index];
                return InkWell(
                  onTap: () {
                    ref.read(agendaMenuProvider.notifier).changeMenu(menu.menu);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      menu.title,
                      style: TextStyle(
                        color:
                            (ref.watch(agendaMenuProvider)?.menu == menu.menu)
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: getContentOfAgenda(ref),
            ),
          ),
        ],
      ),
    );
  }

  Widget getContentOfAgenda(WidgetRef ref) {
    final menu = ref.watch(agendaMenuProvider);
    switch (menu?.menu) {
      case null:
        return const AgendaContentEvents();
      case AgendaMenu.events:
        return const AgendaContentEvents();
      case AgendaMenu.types:
        return const AgendaContentTypes();
      case AgendaMenu.birthdays:
        return const AgendaContentBirthday();
    }
  }

  Widget subtitleWidget(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
