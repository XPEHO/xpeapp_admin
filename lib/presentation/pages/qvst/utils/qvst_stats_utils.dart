// Centralise la logique statistique et reversed pour QVST
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';

class QvstStatsUtils {
  /// Calcule le pourcentage pondéré, avec inversion si isReversed
  static String getPercentOfQuestion(List answers,
      {bool isReversed = false, double minValue = 1, double maxValue = 5}) {
    if (answers.isEmpty) return '0 %';
    double totalValue = 0;
    int totalResponses = 0;
    for (var answer in answers) {
      final ans = answer as QvstAnswerEntity;
      final value = int.tryParse(ans.value) ?? minValue;
      final count = (ans.numberAnswered ?? 0).toInt();
      totalValue += value * count;
      totalResponses += count;
    }
    double average = totalResponses > 0 ? totalValue / totalResponses : 0;
    double percentage = ((average - minValue) / (maxValue - minValue)) * 100;
    if (isReversed) percentage = 100 - percentage;
    return (percentage.isNegative)
        ? '0 %'
        : "${percentage.toStringAsFixed(2)} %";
  }

  /// Renvoie la réponse la plus fréquente parmi les answers (pondéré par numberAnswered)
  static String getAnswerMoreFrequent(List answers, {bool isReversed = false}) {
    if (answers.isEmpty) return '-';
    QvstAnswerEntity? answerMoreFrequent = answers.fold<QvstAnswerEntity?>(
      null,
      (previousValue, element) {
        final ans = element as QvstAnswerEntity;
        if (previousValue == null ||
            (ans.numberAnswered ?? 0) > (previousValue.numberAnswered ?? 0)) {
          return ans;
        }
        return previousValue;
      },
    );
    return answerMoreFrequent?.answer ?? '';
  }

  /// Calcule la liste des questions à afficher, en tenant compte du reversed
  static List<QvstQuestionEntity> getVisibleQuestions({
    required List<QvstQuestionEntity> questions,
    required bool reversed,
  }) {
    if (reversed) {
      return questions.reversed.toList();
    }
    return questions;
  }

  /// Calcule le score moyen d'un thème
  static double getThemeAverageScore(List<QvstQuestionEntity> questions) {
    if (questions.isEmpty) return 0;
    // Suppose que chaque question a une propriété 'answers' avec des scores
    final total = questions.fold<double>(0, (sum, q) {
      final answers = q.answers;
      if (answers.isEmpty) return sum;
      final questionScore =
          answers.fold<double>(0, (s, a) => s + (int.tryParse(a.value) ?? 0)) /
              answers.length;
      return sum + questionScore;
    });
    return total / questions.length;
  }

  /// Calcule le score moyen global
  static double getGlobalAverageScore(
      List<List<QvstQuestionEntity>> themeQuestions) {
    final allQuestions = themeQuestions.expand((t) => t).toList();
    if (allQuestions.isEmpty) return 0;
    final total = allQuestions.fold<double>(0, (sum, q) {
      final answers = q.answers;
      if (answers.isEmpty) return sum;
      final questionScore =
          answers.fold<double>(0, (s, a) => s + (int.tryParse(a.value) ?? 0)) /
              answers.length;
      return sum + questionScore;
    });
    return total / allQuestions.length;
  }

  /// Renvoie la liste des scores pour un thème
  static List<double> getThemeScores(List<QvstQuestionEntity> questions) {
    return questions.map((q) {
      final answers = q.answers;
      if (answers.isEmpty) return 0.0;
      return answers.fold<double>(
              0, (s, a) => s + (int.tryParse(a.value) ?? 0)) /
          answers.length;
    }).toList();
  }

  /// Renvoie la liste des scores pour toutes les questions
  static List<double> getAllScores(List<QvstQuestionEntity> questions) {
    return questions.map((q) {
      final answers = q.answers;
      if (answers.isEmpty) return 0.0;
      return answers.fold<double>(
              0, (s, a) => s + (int.tryParse(a.value) ?? 0)) /
          answers.length;
    }).toList();
  }

  /// Renvoie la liste des questions inversée si reversed
  static List<QvstQuestionEntity> getQuestionsWithReversed(
      List<QvstQuestionEntity> questions, bool reversed) {
    return reversed ? questions.reversed.toList() : questions;
  }

  /// Utilitaire pour obtenir la distribution des scores
  static Map<int, int> getScoreDistribution(
      List<QvstQuestionEntity> questions) {
    final Map<int, int> distribution = {};
    for (final q in questions) {
      final answers = q.answers;
      if (answers.isEmpty) continue;
      final score =
          (answers.fold<double>(0, (s, a) => s + (int.tryParse(a.value) ?? 0)) /
                  answers.length)
              .round();
      distribution[score] = (distribution[score] ?? 0) + 1;
    }
    return distribution;
  }
}
