import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class ThemesAnalysisChart extends StatelessWidget {
  final List<ThemeAnalysisEntity> themesAnalysis;

  const ThemesAnalysisChart({
    super.key,
    required this.themesAnalysis,
  });

  @override
  Widget build(BuildContext context) {
    final chartKey = GlobalKey();

    return CollapsibleCard(
      title: 'Analyse par thème',
      leadingIcon: Icons.category,
      color: Colors.white,
      trailingActions: [
        ScreenshotButton(
          widgetKey: chartKey,
          title: 'Analyse_par_theme',
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepaintBoundary(
            key: chartKey,
            child: SizedBox(
              height: 400,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  labelStyle: const TextStyle(fontSize: 10),
                  maximumLabels: 10,
                  labelIntersectAction: AxisLabelIntersectAction.wrap,
                  maximumLabelWidth: 80,
                ),
                primaryYAxis: NumericAxis(
                  title: AxisTitle(text: 'Satisfaction (%)'),
                  minimum: 0,
                  maximum: 100,
                ),
                series: <CartesianSeries>[
                  ColumnSeries<ThemeAnalysisEntity, String>(
                    name: '',
                    dataSource: themesAnalysis,
                    xValueMapper: (ThemeAnalysisEntity data, _) =>
                        data.themeName,
                    yValueMapper: (ThemeAnalysisEntity data, _) =>
                        data.satisfactionPercentage,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(fontSize: 10),
                    ),
                    pointColorMapper: (ThemeAnalysisEntity data, _) =>
                        (data.requiresAction ?? false)
                            ? Colors.red
                            : Colors.green,
                  ),
                ],
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  builder: (data, point, series, pointIndex, seriesIndex) {
                    final theme = themesAnalysis[pointIndex];
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
                            theme.themeName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Satisfaction: ${theme.satisfactionPercentage?.toStringAsFixed(1) ?? '-'}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          if ((theme.lowScoreQuestionsCount ?? 0) > 0)
                            Text(
                              '${theme.lowScoreQuestionsCount ?? 0} question${(theme.lowScoreQuestionsCount ?? 0) > 1 ? 's' : ''} < 75%',
                              style: const TextStyle(
                                color: Colors.orangeAccent,
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
          ),
          const SizedBox(height: 16),
          _buildLegend(),
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
                    'Satisfaction moyenne par thème. Les colonnes rouges (< 75%) nécessitent une action. '
                    'Le tooltip indique le nombre de questions problématiques dans chaque thème.',
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

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(Colors.green, 'Satisfaisant (≥ 75%)'),
        const SizedBox(width: 20),
        _buildLegendItem(Colors.red, 'Action requise (< 75%)'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
