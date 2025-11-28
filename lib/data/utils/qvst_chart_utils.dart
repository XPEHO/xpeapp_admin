import 'package:flutter/material.dart';

class QvstChartUtils {
  static const Map<int, String> globalAnswerLabels = {
    1: 'Très faible / Jamais / Pas du tout',
    2: 'Faible / Rarement / Plutôt non',
    3: 'Moyen / Occasionnellement / Cela dépend',
    4: 'Bien / Assez souvent / Plutôt oui',
    5: 'Excellent / Très souvent / Tout à fait',
  };

  static const List<Color> globalScoreColors = [
    Color(0xFFD32F2F),
    Color(0xFFF57C00),
    Color(0xFF9E9E9E),
    Color(0xFF8BC34A),
    Color(0xFF388E3C),
  ];

  static String getLabelForScore(int score) {
    return globalAnswerLabels[score] ?? 'Note $score';
  }

  static Color getColorForScore(int score) {
    if (score < 1 || score > 5) return Colors.grey;
    return globalScoreColors[score - 1];
  }

  static Color getSatisfactionColor(double satisfaction) {
    if (satisfaction >= 75) return Colors.green.shade700;
    if (satisfaction >= 50) return Colors.orange.shade700;
    if (satisfaction >= 25) return Colors.red.shade700;
    return Colors.red.shade900;
  }
}

class QvstConstants {
  static const double satisfactionThreshold = 75.0;
}

class QvstFormatters {
  static String formatPercentage(double value, {int decimals = 1}) {
    return '${value.toStringAsFixed(decimals)}%';
  }
}
