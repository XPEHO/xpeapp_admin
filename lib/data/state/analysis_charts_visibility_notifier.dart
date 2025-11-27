import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnalysisChartsVisibilityNotifier
    extends StateNotifier<Map<String, bool>> {
  AnalysisChartsVisibilityNotifier()
      : super({
          'globalStats': true,
          'questionsAnalysis': true,
          'globalDistribution': true,
          'questionsDetailed': true,
          'atRiskEmployees': true,
        });

  void toggleChart(String chartKey) {
    state = {
      ...state,
      chartKey: !(state[chartKey] ?? true),
    };
  }

  void showChart(String chartKey) {
    state = {
      ...state,
      chartKey: true,
    };
  }

  void hideChart(String chartKey) {
    state = {
      ...state,
      chartKey: false,
    };
  }

  void showAll() {
    state = state.map((key, value) => MapEntry(key, true));
  }

  void hideAll() {
    state = state.map((key, value) => MapEntry(key, false));
  }

  void toggleAll() {
    final allVisible = state.values.every((visible) => visible);
    if (allVisible) {
      hideAll();
    } else {
      showAll();
    }
  }

  bool isVisible(String chartKey) {
    return state[chartKey] ?? true;
  }
}
