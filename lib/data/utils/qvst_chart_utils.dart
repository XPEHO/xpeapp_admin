import 'package:flutter/material.dart';

class QvstChartUtils {
  static String getLabelForScore(int score, {Map<int, String>? labels}) {
    if (labels != null && labels.containsKey(score)) {
      return labels[score]!;
    }
    return 'Note $score';
  }

  /// Returns the color for a given score, with optional inversion for reversed questions.
  /// When `isReversed` is false (positive question): mapping is green → red (score 5 = green, score 1 = red).
  /// When `isReversed` is true (negative question): mapping is inverted so that favorable responses stay green.
  static Color getColorForScore(int score, {bool isReversed = false}) {
    if (score < 1 || score > 5) return Colors.grey;

    const Map<int, Color> positiveMapping = {
      5: Color(0xFF388E3C), // Green: Strongly agree / very positive
      4: Color(0xFF8BC34A), // Light green
      3: Color(0xFF9E9E9E), // Neutral (grey/yellow)
      2: Color(0xFFF57C00), // Orange
      1: Color(0xFFD32F2F), // Red: Strongly disagree / very negative
    };

    const Map<int, Color> reversedMapping = {
      5: Color(0xFFD32F2F), // Red: high score is negative in this context
      4: Color(0xFFF57C00), // Orange
      3: Color(0xFF9E9E9E), // Neutral
      2: Color(0xFF8BC34A), // Light green
      1: Color(0xFF388E3C), // Green: low score is positive in this context
    };

    final mapping = isReversed ? reversedMapping : positiveMapping;
    return mapping[score] ?? Colors.grey;
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
