import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/chart_config.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstChartsFilterWidget extends ConsumerStatefulWidget {
  const QvstChartsFilterWidget({super.key});

  @override
  ConsumerState<QvstChartsFilterWidget> createState() =>
      _QvstChartsFilterWidgetState();
}

class _QvstChartsFilterWidgetState
    extends ConsumerState<QvstChartsFilterWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final chartsVisibility = ref.watch(analysisChartsVisibilityProvider);
    final visibleChartsCount = chartsVisibility.values.where((v) => v).length;
    const availableCharts = QvstChartConfigs.availableCharts;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(25),
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
              const Icon(Icons.dashboard, color: kDefaultXpehoColor),
              const SizedBox(width: 8),
              const Text(
                'Graphiques à afficher',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: kDefaultXpehoColor.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '$visibleChartsCount/${availableCharts.length}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kDefaultXpehoColor,
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  ref
                      .read(analysisChartsVisibilityProvider.notifier)
                      .toggleAll();
                },
                child: Text(
                  visibleChartsCount == availableCharts.length
                      ? 'Tout masquer'
                      : 'Tout afficher',
                  style: const TextStyle(color: kDefaultXpehoColor),
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
          if (_isExpanded) ...[
            _buildExpandedFilterSection(chartsVisibility, availableCharts),
          ],
        ],
      ),
    );
  }

  Widget _buildExpandedFilterSection(
    Map<String, bool> chartsVisibility,
    List<ChartConfig> availableCharts,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          'Sélectionnez les graphiques à afficher :',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        ...availableCharts.map((chart) {
          final isVisible = chartsVisibility[chart.key] ?? true;

          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: isVisible
                    ? kDefaultXpehoColor.withAlpha(75)
                    : Colors.grey.withAlpha(75),
              ),
              borderRadius: BorderRadius.circular(8),
              color: isVisible
                  ? kDefaultXpehoColor.withAlpha(25)
                  : Colors.grey.withAlpha(25),
            ),
            child: CheckboxListTile(
              title: Row(
                children: [
                  Icon(
                    chart.icon,
                    size: 20,
                    color: isVisible ? kDefaultXpehoColor : Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    chart.name,
                    style: TextStyle(
                      color: isVisible ? kDefaultXpehoColor : Colors.grey,
                      fontWeight:
                          isVisible ? FontWeight.w500 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
              value: isVisible,
              onChanged: (bool? value) {
                ref
                    .read(analysisChartsVisibilityProvider.notifier)
                    .toggleChart(chart.key);
              },
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: kDefaultXpehoColor,
            ),
          );
        }),
      ],
    );
  }
}
