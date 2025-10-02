import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstChoiceMultipleThemes extends ConsumerStatefulWidget {
  const QvstChoiceMultipleThemes({super.key});

  @override
  ConsumerState<QvstChoiceMultipleThemes> createState() =>
      _QvstChoiceMultipleThemesState();
}

class _QvstChoiceMultipleThemesState
    extends ConsumerState<QvstChoiceMultipleThemes> {
  @override
  Widget build(BuildContext context) {
    final themesAsync = ref.watch(qvstThemesListProvider);
    final selectedThemes = ref.watch(qvstThemesSelectionProvider);

    return themesAsync.when(
      data: (themes) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedThemes.isNotEmpty) ...[
            const Text(
              'Thèmes sélectionnés :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: selectedThemes.map((theme) {
                return Chip(
                  label: Text(
                    theme.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: kDefaultXpehoColor,
                  deleteIcon: const Icon(Icons.close, size: 18),
                  onDeleted: () {
                    ref
                        .read(qvstThemesSelectionProvider.notifier)
                        .removeTheme(theme);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
          const Text(
            'Thèmes disponibles :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            constraints: const BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: themes.length,
              itemBuilder: (context, index) {
                final theme = themes[index];
                final isSelected = selectedThemes.any((t) => t.id == theme.id);

                return CheckboxListTile(
                  title: Text(theme.name),
                  value: isSelected,
                  onChanged: (bool? value) {
                    ref
                        .read(qvstThemesSelectionProvider.notifier)
                        .toggleTheme(theme);
                    // Réinitialiser les questions quand on change les thèmes
                    ref.read(qvstQuestionsForCampaignProvider.notifier).reset();
                  },
                  dense: true,
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
            ),
          ),
        ],
      ),
      error: (error, stack) => Center(
        child: Text('Erreur: $error'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
