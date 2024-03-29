import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/data/enum/qvst_menu.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstThemesListWidget extends ConsumerWidget {
  const QvstThemesListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themesList = ref.watch(qvstThemesListProvider);
    return themesList.when(
      data: (themes) {
        QvstThemeEntity allThemes = QvstThemeEntity(
          id: "0",
          name: 'Tous les thèmes',
        );
        themes.insert(0, allThemes);
        return ListView.builder(
          shrinkWrap: true,
          itemCount: themes.length,
          itemBuilder: (context, index) {
            final theme = themes[index];
            return Center(
              child: ListTile(
                onTap: () {
                  ref.read(qvstMenuProvider.notifier).changeMenu(
                        QvstMenu.theme,
                        id: (theme.id == "0" ? null : theme.id),
                      );
                },
                title: Text(
                  '- ${theme.name}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) => Text('Erreur: $error'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
