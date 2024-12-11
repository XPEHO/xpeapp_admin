import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstChoiceTheme extends ConsumerStatefulWidget {
  const QvstChoiceTheme({super.key});

  @override
  ConsumerState<QvstChoiceTheme> createState() => _QvstChoiceThemeState();
}

class _QvstChoiceThemeState extends ConsumerState<QvstChoiceTheme> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(qvstThemesListProvider);
    return theme.when(
      data: (data) => DropdownButton<QvstThemeEntity>(
        value: ref.watch(qvstNotifierProvider),
        hint: const Text('Sélectionnez un thème'),
        onChanged: (QvstThemeEntity? newValue) {
          ref.watch(qvstNotifierProvider.notifier).setTheme(newValue!);
          ref.watch(qvstQuestionsForCampaignProvider.notifier).reset();
        },
        items: data
            .map<DropdownMenuItem<QvstThemeEntity>>(
              (QvstThemeEntity value) => DropdownMenuItem<QvstThemeEntity>(
                value: value,
                child: Text(value.name),
              ),
            )
            .toList(),
      ),
      error: (error, stack) => Center(
        child: Text('Erreur ${stack.toString()}'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
