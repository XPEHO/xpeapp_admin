import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/common/collapsible_card.dart';
import 'package:xpeapp_admin/presentation/widgets/common/screenshot_button.dart';

class ThemesAnalysisChart extends StatelessWidget {
  final List<ThemeAnalysisEntity> themesAnalysis;

  static const double _chartHeight = 400.0;
  static const double _satisfactionThreshold = 75.0;
  static const Color _satisfyingColor = Colors.green;
  static const Color _criticalColor = Colors.red;
  static const TextStyle _tooltipTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle _tooltipTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
  );

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
          themesAnalysis.isEmpty ? _buildEmptyState() : _buildChart(chartKey),
          const SizedBox(height: 16),
          _buildLegend(),
          const SizedBox(height: 16),
          _buildInfoBanner(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(_satisfyingColor,
            'Satisfaisant (≥ ${_satisfactionThreshold.toInt()}%)'),
        const SizedBox(width: 20),
        _buildLegendItem(_criticalColor,
            'Action requise (< ${_satisfactionThreshold.toInt()}%)'),
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

  Widget _buildEmptyState() {
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.info_outline, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Aucune donnée d\'analyse par thème disponible',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart(GlobalKey chartKey) {
    return RepaintBoundary(
      key: chartKey,
      child: SizedBox(
        height: _chartHeight,
        child: SfCartesianChart(
          primaryXAxis: const CategoryAxis(
            labelStyle: TextStyle(fontSize: 10),
            maximumLabels: 10,
            labelIntersectAction: AxisLabelIntersectAction.wrap,
            maximumLabelWidth: 80,
          ),
          primaryYAxis: const NumericAxis(
            title: AxisTitle(text: 'Satisfaction (%)'),
            minimum: 0,
            maximum: 100,
          ),
          series: [_buildColumnSeries()],
          tooltipBehavior: _buildTooltipBehavior(),
        ),
      ),
    );
  }

  ColumnSeries<ThemeAnalysisEntity, String> _buildColumnSeries() {
    return ColumnSeries<ThemeAnalysisEntity, String>(
      name: '',
      dataSource: themesAnalysis,
      xValueMapper: (data, _) => data.themeName,
      yValueMapper: (data, _) => data.satisfactionPercentage,
      dataLabelSettings: const DataLabelSettings(
        isVisible: true,
        textStyle: TextStyle(fontSize: 10),
      ),
      pointColorMapper: (data, _) => _getThemeColor(data),
    );
  }

  Color _getThemeColor(ThemeAnalysisEntity data) {
    return (data.requiresAction ?? false) ? _criticalColor : _satisfyingColor;
  }

  TooltipBehavior _buildTooltipBehavior() {
    return TooltipBehavior(
      enable: true,
      builder: (data, point, series, pointIndex, seriesIndex) {
        final theme = themesAnalysis[pointIndex];
        return _buildTooltipContent(theme);
      },
    );
  }

  Widget _buildTooltipContent(ThemeAnalysisEntity theme) {
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
          Text(theme.themeName, style: _tooltipTitleStyle),
          const SizedBox(height: 4),
          Text(
            'Satisfaction: ${theme.satisfactionPercentage?.toStringAsFixed(1) ?? '-'}%',
            style: _tooltipTextStyle,
          ),
          if ((theme.lowScoreQuestionsCount ?? 0) > 0)
            Text(
              '${theme.lowScoreQuestionsCount ?? 0} question${(theme.lowScoreQuestionsCount ?? 0) > 1 ? 's' : ''} < ${_satisfactionThreshold.toInt()}%',
              style: const TextStyle(color: Colors.orangeAccent, fontSize: 11),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoBanner() {
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
              'Satisfaction moyenne par thème. Les colonnes rouges (< ${_satisfactionThreshold.toInt()}%) nécessitent une action. '
              'Le tooltip indique le nombre de questions problématiques dans chaque thème.',
              style: TextStyle(color: Colors.blue.shade900, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
