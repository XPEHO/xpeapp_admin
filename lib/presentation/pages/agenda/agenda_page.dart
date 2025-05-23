import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/enum/agenda_menu.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/content/agenda_content_birthday.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/content/agenda_content_events.dart';
import 'package:xpeapp_admin/presentation/pages/agenda/content/agenda_content_types.dart';
import 'package:xpeapp_admin/providers.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildMenuItem(context, 'Types', AgendaMenu.types),
                buildMenuItem(context, 'Événements', AgendaMenu.events),
                buildMenuItem(context, 'Anniversaires', AgendaMenu.birthdays),
              ],
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

  Widget buildMenuItem(BuildContext context, String title, AgendaMenu menu) {
    return InkWell(
      onTap: () {
        ref.read(selectedAgendaMenuProvider.notifier).changeMenu(menu);
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Text(
          title,
          style: TextStyle(
            color: (ref.watch(selectedAgendaMenuProvider) == menu)
                ? kDefaultXpehoColor
                : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget getContentOfAgenda(WidgetRef ref) {
    final menu = ref.watch(selectedAgendaMenuProvider);
    switch (menu) {
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
