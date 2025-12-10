import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/state/analysis_charts_visibility_notifier.dart';

void main() {
  group('AnalysisChartsVisibilityNotifier', () {
    late AnalysisChartsVisibilityNotifier notifier;

    setUp(() {
      notifier = AnalysisChartsVisibilityNotifier();
    });

    test('initial state: all charts visible', () {
      expect(notifier.state, {
        'globalStats': true,
        'questionsAnalysis': true,
        'globalDistribution': true,
        'questionsDetailed': true,
        'atRiskEmployees': true,
      });
    });

    test('toggleChart toggles visibility', () {
      notifier.toggleChart('globalStats');
      expect(notifier.state['globalStats'], isFalse);
      notifier.toggleChart('globalStats');
      expect(notifier.state['globalStats'], isTrue);
    });

    test('showChart sets chart visible', () {
      notifier.hideChart('globalStats');
      notifier.showChart('globalStats');
      expect(notifier.state['globalStats'], isTrue);
    });

    test('hideChart sets chart hidden', () {
      notifier.showChart('globalStats');
      notifier.hideChart('globalStats');
      expect(notifier.state['globalStats'], isFalse);
    });

    test('showAll sets all charts visible', () {
      notifier.hideAll();
      notifier.showAll();
      expect(notifier.state.values.every((v) => v), isTrue);
    });

    test('hideAll sets all charts hidden', () {
      notifier.showAll();
      notifier.hideAll();
      expect(notifier.state.values.every((v) => !v), isTrue);
    });

    test('toggleAll toggles all charts', () {
      notifier.toggleAll();
      expect(notifier.state.values.every((v) => !v), isTrue);
      notifier.toggleAll();
      expect(notifier.state.values.every((v) => v), isTrue);
    });

    test('isVisible returns correct value', () {
      notifier.hideChart('globalStats');
      expect(notifier.isVisible('globalStats'), isFalse);
      notifier.showChart('globalStats');
      expect(notifier.isVisible('globalStats'), isTrue);
      // Unknown key returns true by default
      expect(notifier.isVisible('unknownKey'), isTrue);
    });
  });
}
