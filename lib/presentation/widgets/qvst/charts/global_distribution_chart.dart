import 'package:xpeapp_admin/data/utils/qvst_chart_utils.dart';
import 'package:xpeapp_admin/data/utils/qvst_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class GlobalDistributionChart extends StatelessWidget {
  final List<GlobalDistributionEntity> distribution;
  final Map<int, String>? answerLabels;

  static const int _maxResponseScore = 5;

  const GlobalDistributionChart({
    super.key,
    required this.distribution,
    this.answerLabels,
  });

  @override
  Widget build(BuildContext context) {
    final chartKey = GlobalKey();

    final scoreMap = Map.fromEntries(
      distribution
          .where((d) => d.score != null)
          .map((d) => MapEntry(d.score!, d.count ?? 0)),
    );
    final scores =
        List.generate(_maxResponseScore, (i) => scoreMap[i + 1] ?? 0);

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
                  _maxResponseScore,
                  (i) => StackedColumn100Series<_ChartData, String>(
                    name: QvstChartUtils.getLabelForScore(i + 1,
                        labels: answerLabels),
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
          const QvstInfoBanner(
            text:
                'Répartition globale des notes données par les collaborateurs.',
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
