import 'package:flutter/material.dart';

// Object representing a chart configuration
class ChartConfig {
  final String key;
  final String name;
  final IconData icon;

  const ChartConfig({
    required this.key,
    required this.name,
    required this.icon,
  });
}

///listing of available chart configurations for QVST analysis
class QvstChartConfigs {
  static const List<ChartConfig> availableCharts = [
    ChartConfig(
      key: 'globalStats',
      name: 'Statistiques globales',
      icon: Icons.analytics,
    ),
    ChartConfig(
      key: 'questionsAnalysis',
      name: 'Toutes les questions',
      icon: Icons.quiz,
    ),
    ChartConfig(
      key: 'globalDistribution',
      name: 'Répartition globale',
      icon: Icons.pie_chart,
    ),
    ChartConfig(
      key: 'questionsDetailed',
      name: 'Questions détaillées',
      icon: Icons.bar_chart,
    ),
    ChartConfig(
      key: 'atRiskEmployees',
      name: 'Collaborateurs à risque',
      icon: Icons.warning,
    ),
  ];

  // Convert the available charts to a map for easier access
  static Map<String, Map<String, dynamic>> toMap() {
    return {
      for (final chart in availableCharts)
        chart.key: {'name': chart.name, 'icon': chart.icon},
    };
  }
}
