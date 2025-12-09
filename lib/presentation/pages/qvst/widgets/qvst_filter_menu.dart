import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/chart_config.dart';
import 'package:xpeapp_admin/providers.dart';

class QvstFilterMenu extends ConsumerWidget {
  final bool isOpen;

  const QvstFilterMenu({
    super.key,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isOpen) return const SizedBox.shrink();

    final chartsVisibility = ref.watch(analysisChartsVisibilityProvider);
    final visibleCount = chartsVisibility.values.where((v) => v).length;
    const charts = QvstChartConfigs.availableCharts;

    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(visibleCount, charts.length),
          ...charts.map(
            (chart) => _buildChartItem(ref, chart, chartsVisibility),
          ),
          _buildToggleAllButton(ref, visibleCount, charts.length),
        ],
      ),
    );
  }

  Widget _buildHeader(int visibleCount, int totalCount) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: kDefaultXpehoColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.dashboard, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Text(
            'Graphiques ($visibleCount/$totalCount)',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartItem(
    WidgetRef ref,
    ChartConfig chart,
    Map<String, bool> chartsVisibility,
  ) {
    final isVisible = chartsVisibility[chart.key] ?? true;

    return InkWell(
      onTap: () {
        ref
            .read(analysisChartsVisibilityProvider.notifier)
            .toggleChart(chart.key);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isVisible ? kDefaultXpehoColor.withAlpha(13) : null,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.withAlpha(20),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              chart.icon,
              color: isVisible ? kDefaultXpehoColor : Colors.grey,
              size: 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                chart.name,
                style: TextStyle(
                  color: isVisible ? kDefaultXpehoColor : Colors.grey,
                  fontWeight: isVisible ? FontWeight.w500 : FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ),
            Icon(
              isVisible ? Icons.check_box : Icons.check_box_outline_blank,
              color: isVisible ? kDefaultXpehoColor : Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleAllButton(
      WidgetRef ref, int visibleCount, int totalCount) {
    final allVisible = visibleCount == totalCount;

    return InkWell(
      onTap: () {
        ref.read(analysisChartsVisibilityProvider.notifier).toggleAll();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              allVisible ? Icons.visibility_off : Icons.visibility,
              color: kDefaultXpehoColor,
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              allVisible ? 'Tout masquer' : 'Tout afficher',
              style: const TextStyle(
                color: kDefaultXpehoColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
