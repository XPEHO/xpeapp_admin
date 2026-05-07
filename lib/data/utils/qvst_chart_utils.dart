import 'package:flutter/material.dart';

class QvstChartUtils {
  static String getLabelForScore(int score, {Map<int, String>? labels}) {
    if (labels != null && labels.containsKey(score)) {
      return labels[score]!;
    }
    return 'Note $score';
  }

  /// Retourne la couleur pour un score, avec inversion si la question est inversée
  /// Si reversed=false (question positive): vert → rouge (5 vert, 1 rouge)
  /// Si reversed=true (question négative): rouge → vert (5 rouge, 1 vert = inversé)
  static Color getColorForScore(int score, {bool isReversed = false}) {
    if (score < 1 || score > 5) return Colors.grey;

    const Map<int, Color> positiveMapping = {
      5: Color(0xFF388E3C), // Vert: Tout a fait
      4: Color(0xFF8BC34A), // Vert clair
      3: Color(0xFF9E9E9E), // Gris/Jaune: Neutre
      2: Color(0xFFF57C00), // Orange
      1: Color(0xFFD32F2F), // Rouge: Pas du tout
    };

    const Map<int, Color> reversedMapping = {
      5: Color(0xFFD32F2F), // Rouge: Tout à fait (mauvais dans ce contexte)
      4: Color(0xFFF57C00), // Orange
      3: Color(0xFF9E9E9E), // Gris/Jaune: Neutre
      2: Color(0xFF8BC34A), // Vert clair
      1: Color(0xFF388E3C), // Vert: Pas du tout (bon dans ce contexte)
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
