import 'package:xpeapp_admin/data/utils/qvst_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/data/utils/qvst_chart_utils.dart';
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
    final scoreMap = {
      for (final d in distribution)
        if (d.score != null && d.count != null) d.score!: d.count!,
    };

    return List.generate(5, (i) {
      final score = i + 1;
      return _ChartData(
        QvstChartUtils.getLabelForScore(score),
        scoreMap[score] ?? 0,
        QvstChartUtils.getColorForScore(score),
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
                        '${d.label}\n${d.count} réponses\n${QvstFormatters.formatPercentage(pct)}',
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
          const QvstInfoBanner(
            text: 'Vue synthétique de la distribution des réponses.',
          ),
        ],
      ),
    );
  }
}

// QvstInfoBanner utilisé à la place de _InfoBox

class _ChartData {
  final String label;
  final int count;
  final Color color;

  _ChartData(this.label, this.count, this.color);
}
