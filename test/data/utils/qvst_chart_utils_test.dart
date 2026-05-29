import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/utils/qvst_chart_utils.dart';

void main() {
  group('QvstChartUtils.getColorForScore', () {
    test('returns green for score 5 when not reversed', () {
      final color = QvstChartUtils.getColorForScore(5, isReversed: false);
      expect(color, equals(const Color(0xFF388E3C)));
    });

    test('returns red for score 1 when not reversed', () {
      final color = QvstChartUtils.getColorForScore(1, isReversed: false);
      expect(color, equals(const Color(0xFFD32F2F)));
    });

    test('returns inverted mapping when reversed=true (score 1 -> green)', () {
      final color = QvstChartUtils.getColorForScore(1, isReversed: true);
      expect(color, equals(const Color(0xFF388E3C)));
    });

    test('returns inverted mapping when reversed=true (score 5 -> red)', () {
      final color = QvstChartUtils.getColorForScore(5, isReversed: true);
      expect(color, equals(const Color(0xFFD32F2F)));
    });

    test('out-of-range returns grey', () {
      final colorLow = QvstChartUtils.getColorForScore(0);
      final colorHigh = QvstChartUtils.getColorForScore(6);
      expect(colorLow, equals(Colors.grey));
      expect(colorHigh, equals(Colors.grey));
    });
  });
}
