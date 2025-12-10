import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstThemeFilterWidget extends ConsumerStatefulWidget {
  const QvstThemeFilterWidget({super.key});

  @override
  ConsumerState<QvstThemeFilterWidget> createState() =>
      _QvstThemeFilterWidgetState();
}

class _QvstThemeFilterWidgetState extends ConsumerState<QvstThemeFilterWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final themesAsync = ref.watch(qvstThemesListProvider);
    final selectedThemes = ref.watch(analysisThemeFilterProvider);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(10),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.filter_list, color: kDefaultXpehoColor),
              const SizedBox(width: 8),
              const Text(
                'Filtrer par thèmes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              if (selectedThemes.isNotEmpty)
                TextButton(
                  onPressed: () {
                    ref.read(analysisThemeFilterProvider.notifier).reset();
                  },
                  child: const Text(
                    'Effacer',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
              ),
            ],
          ),
          if (selectedThemes.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text(
              'Thèmes sélectionnés :',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.grey,
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
                        .read(analysisThemeFilterProvider.notifier)
                        .removeTheme(theme);
                  },
                );
              }).toList(),
            ),
          ],
          if (_isExpanded) ...[
            const SizedBox(height: 16),
            themesAsync.when(
              data: (themes) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thèmes disponibles :',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey,
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
                        final isSelected =
                            selectedThemes.any((t) => t.id == theme.id);

                        return CheckboxListTile(
                          title: Text(theme.name),
                          value: isSelected,
                          onChanged: (bool? value) {
                            ref
                                .read(analysisThemeFilterProvider.notifier)
                                .toggleTheme(theme);
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
            ),
          ],
        ],
      ),
    );
  }
}
