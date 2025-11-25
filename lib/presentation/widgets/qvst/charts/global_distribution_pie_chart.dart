import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class GlobalDistributionPieChart extends StatelessWidget {
  final List<GlobalDistributionEntity> distribution;
  final Map<int, String>? answerLabels;

  const GlobalDistributionPieChart({
    super.key,
    required this.distribution,
    this.answerLabels,
  });

  List<_ChartData> _prepareData() {
    final colors = [
      Colors.red.shade700,
      Colors.orange.shade700,
      Colors.grey.shade500,
      Colors.lightGreen.shade600,
      Colors.green.shade700,
    ];

    final scoreMap = {
      for (final d in distribution)
        if (d.score != null && d.count != null) d.score!: d.count!,
    };

    return List.generate(5, (i) {
      final score = i + 1;
      return _ChartData(
        answerLabels?[score] ?? 'Note $score',
        scoreMap[score] ?? 0,
        colors[i],
      );
    }).where((d) => d.count > 0).toList();
  }

  int _getTotalCount() =>
      distribution.fold(0, (sum, d) => sum + (d.count ?? 0));

  @override
  Widget build(BuildContext context) {
    final data = _prepareData();
    final chartKey = GlobalKey();

    return CollapsibleCard(
      title: 'Distribution des réponses',
      leadingIcon: Icons.pie_chart,
      color: Colors.white,
      trailingActions: [
        ScreenshotButton(
            widgetKey: chartKey, title: 'Distribution_des_réponses'),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepaintBoundary(
            key: chartKey,
            child: SizedBox(
              height: 400,
              child: SfCircularChart(
                legend: const Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                series: <CircularSeries>[
                  PieSeries<_ChartData, String>(
                    dataSource: data,
                    xValueMapper: (d, _) => d.label,
                    yValueMapper: (d, _) => d.count,
                    pointColorMapper: (d, _) => d.color,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                      connectorLineSettings: ConnectorLineSettings(
                        type: ConnectorType.line,
                      ),
                    ),
                    enableTooltip: true,
                  ),
                ],
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  builder: (raw, _, __, ___, ____) {
                    final d = raw as _ChartData;
                    final pct = (d.count / _getTotalCount()) * 100;

                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${d.label}\n${d.count} réponses\n${pct.toStringAsFixed(1)}%',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _InfoBox(),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              'Vue synthétique de la distribution des réponses.',
              style: TextStyle(color: Colors.blue.shade900, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String label;
  final int count;
  final Color color;

  _ChartData(this.label, this.count, this.color);
}
