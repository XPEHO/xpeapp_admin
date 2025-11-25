import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class GlobalDistributionChart extends StatelessWidget {
  final List<GlobalDistributionEntity> distribution;

  const GlobalDistributionChart({
    super.key,
    required this.distribution,
  });

  @override
  Widget build(BuildContext context) {
    final chartKey = GlobalKey();

    final scores = List.generate(5, (i) {
      final score = i + 1;
      return distribution
              .firstWhere(
                (d) => d.score == score,
                orElse: () => GlobalDistributionEntity(score: score, count: 0),
              )
              .count ??
          0;
    });

    final colors = [
      Colors.red.shade700,
      Colors.orange.shade700,
      Colors.orange.shade400,
      Colors.green.shade400,
      Colors.green.shade700,
    ];

    return CollapsibleCard(
      title: 'Distribution globale des réponses',
      leadingIcon: Icons.stacked_bar_chart,
      color: Colors.white,
      trailingActions: [
        ScreenshotButton(
          widgetKey: chartKey,
          title: 'Distribution_globale_reponses',
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepaintBoundary(
            key: chartKey,
            child: SizedBox(
              height: 300,
              child: SfCartesianChart(
                primaryXAxis: const CategoryAxis(),
                primaryYAxis: NumericAxis(
                  title: const AxisTitle(text: 'Pourcentage'),
                  numberFormat: NumberFormat.percentPattern(),
                ),
                series: List.generate(
                  5,
                  (i) => StackedColumn100Series<_ChartData, String>(
                    name: 'Score ${i + 1}',
                    dataSource: [_ChartData('Distribution', scores)],
                    xValueMapper: (data, _) => data.category,
                    yValueMapper: (data, _) => data.scores[i],
                    color: colors[i],
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.middle,
                      builder: (data, point, series, pointIndex, seriesIndex) {
                        final value = (data as _ChartData).scores[i];
                        return value > 0
                            ? Text(value.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                            : const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  format: 'series.name : point.y réponses',
                ),
                legend: const Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Répartition globale des notes données par les collaborateurs.',
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String category;
  final List<int> scores;

  _ChartData(this.category, this.scores);
}
