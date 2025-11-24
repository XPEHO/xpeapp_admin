import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';

class GlobalDistributionChart extends StatelessWidget {
  final List<GlobalDistributionEntity> distribution;

  const GlobalDistributionChart({
    super.key,
    required this.distribution,
  });

  @override
  Widget build(BuildContext context) {
    // Créer les données pour le graphique empilé à 100%
    final List<_StackedData> stackedData = _prepareStackedData();

    return CollapsibleCard(
      title: 'Distribution globale des réponses',
      leadingIcon: Icons.stacked_bar_chart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: 'Pourcentage'),
                numberFormat: NumberFormat.percentPattern(),
              ),
              series: <CartesianSeries>[
                StackedColumn100Series<_StackedData, String>(
                  name: 'Score 1',
                  dataSource: stackedData,
                  xValueMapper: (_StackedData data, _) => data.category,
                  yValueMapper: (_StackedData data, _) => data.score1,
                  color: Colors.red.shade700,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      final value = (data as _StackedData).score1;
                      return value > 0
                          ? Text(
                              value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
                StackedColumn100Series<_StackedData, String>(
                  name: 'Score 2',
                  dataSource: stackedData,
                  xValueMapper: (_StackedData data, _) => data.category,
                  yValueMapper: (_StackedData data, _) => data.score2,
                  color: Colors.orange.shade700,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      final value = (data as _StackedData).score2;
                      return value > 0
                          ? Text(
                              value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
                StackedColumn100Series<_StackedData, String>(
                  name: 'Score 3',
                  dataSource: stackedData,
                  xValueMapper: (_StackedData data, _) => data.category,
                  yValueMapper: (_StackedData data, _) => data.score3,
                  color: Colors.orange.shade400,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      final value = (data as _StackedData).score3;
                      return value > 0
                          ? Text(
                              value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
                StackedColumn100Series<_StackedData, String>(
                  name: 'Score 4',
                  dataSource: stackedData,
                  xValueMapper: (_StackedData data, _) => data.category,
                  yValueMapper: (_StackedData data, _) => data.score4,
                  color: Colors.green.shade400,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      final value = (data as _StackedData).score4;
                      return value > 0
                          ? Text(
                              value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
                StackedColumn100Series<_StackedData, String>(
                  name: 'Score 5',
                  dataSource: stackedData,
                  xValueMapper: (_StackedData data, _) => data.category,
                  yValueMapper: (_StackedData data, _) => data.score5,
                  color: Colors.green.shade700,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelAlignment: ChartDataLabelAlignment.middle,
                    builder: (data, point, series, pointIndex, seriesIndex) {
                      final value = (data as _StackedData).score5;
                      return value > 0
                          ? Text(
                              value.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
              ],
              tooltipBehavior: TooltipBehavior(
                enable: true,
                format: 'series.name : point.y réponses',
              ),
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
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
                    'Graphique empilé à 100% montrant la répartition de toutes les réponses. '
                    'Chaque segment représente le pourcentage de collaborateurs ayant donné cette note.',
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

  List<_StackedData> _prepareStackedData() {
    final score1 = distribution
        .firstWhere(
          (d) => d.score == 1,
          orElse: () => GlobalDistributionEntity(score: 1, count: 0),
        )
        .count;
    final score2 = distribution
        .firstWhere(
          (d) => d.score == 2,
          orElse: () => GlobalDistributionEntity(score: 2, count: 0),
        )
        .count;
    final score3 = distribution
        .firstWhere(
          (d) => d.score == 3,
          orElse: () => GlobalDistributionEntity(score: 3, count: 0),
        )
        .count;
    final score4 = distribution
        .firstWhere(
          (d) => d.score == 4,
          orElse: () => GlobalDistributionEntity(score: 4, count: 0),
        )
        .count;
    final score5 = distribution
        .firstWhere(
          (d) => d.score == 5,
          orElse: () => GlobalDistributionEntity(score: 5, count: 0),
        )
        .count;

    return [
      _StackedData(
        category: 'Distribution',
        score1: score1 ?? 0,
        score2: score2 ?? 0,
        score3: score3 ?? 0,
        score4: score4 ?? 0,
        score5: score5 ?? 0,
      ),
    ];
  }
}

class _StackedData {
  _StackedData({
    required this.category,
    required this.score1,
    required this.score2,
    required this.score3,
    required this.score4,
    required this.score5,
  });

  final String category;
  final int score1;
  final int score2;
  final int score3;
  final int score4;
  final int score5;
}
