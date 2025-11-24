import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';

class GlobalDistributionPieChart extends StatelessWidget {
  final List<GlobalDistributionEntity> distribution;
  final Map<int, String>? answerLabels;

  const GlobalDistributionPieChart({
    super.key,
    required this.distribution,
    this.answerLabels,
  });

  List<_ChartData> _prepareData() {
    final scores = <int, int>{};
    for (var dist in distribution) {
      if (dist.score != null && dist.count != null) {
        scores[dist.score!] = dist.count!;
      }
    }

    final colors = [
      Colors.red.shade700,
      Colors.orange.shade700,
      Colors.grey.shade500,
      Colors.lightGreen.shade600,
      Colors.green.shade700,
    ];

    return List.generate(5, (i) {
      final score = i + 1;
      final label = answerLabels != null && answerLabels![score] != null
          ? answerLabels![score]!
          : 'Note $score';
      return _ChartData(label, scores[score] ?? 0, colors[i]);
    }).where((data) => data.count > 0).toList();
  }

  int _getTotalCount() {
    return distribution.fold(0, (sum, dist) => sum + (dist.count ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    final data = _prepareData();

    return CollapsibleCard(
      title: 'Distribution des réponses',
      leadingIcon: Icons.pie_chart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 400,
            child: SfCircularChart(
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap,
              ),
              series: <CircularSeries>[
                PieSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.label,
                  yValueMapper: (_ChartData data, _) => data.count,
                  pointColorMapper: (_ChartData data, _) => data.color,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      final chartData = (data as _ChartData);
                      final total = _getTotalCount();
                      final percentage = (chartData.count / total * 100);
                      return Container(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          '${percentage.toStringAsFixed(1)}%\n(${chartData.count})',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                  enableTooltip: true,
                ),
              ],
              tooltipBehavior: TooltipBehavior(
                enable: true,
                builder: (data, point, series, pointIndex, seriesIndex) {
                  final chartData = data as _ChartData;
                  final total = _getTotalCount();
                  final percentage = (chartData.count / total * 100);
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chartData.label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${chartData.count} réponse${chartData.count > 1 ? 's' : ''}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${percentage.toStringAsFixed(1)}%',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
                    'Vue synthétique de la distribution des réponses. '
                    'Chaque part du camembert représente le nombre de collaborateurs ayant donné cette note.',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 12,
                    ),
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
  final String label;
  final int count;
  final Color color;

  _ChartData(this.label, this.count, this.color);
}
