import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QvstAnalysisEntity', () {
    test('default values', () {
      final entity = QvstAnalysisEntity();
      expect(entity.campaignId, isNull);
      expect(entity.campaignName, '');
      expect(entity.campaignStatus, '');
      expect(entity.startDate, '');
      expect(entity.endDate, '');
      expect(entity.themes, isEmpty);
      expect(entity.globalStats, isNull);
      expect(entity.globalDistribution, isEmpty);
      expect(entity.themesAnalysis, isEmpty);
      expect(entity.questionsAnalysis, isEmpty);
      expect(entity.questionsRequiringAction, isEmpty);
      expect(entity.atRiskEmployees, isEmpty);
    });

    test('fromJson parses values', () {
      final json = {
        'campaign_id': 1,
        'campaign_name': 'Test',
        'campaign_status': 'active',
        'start_date': '2025-01-01',
        'end_date': '2025-01-31',
        'themes': [
          {'id': 't1', 'name': 'Theme 1'}
        ],
        'global_stats': {
          'total_respondents': '10',
          'total_questions': 5,
          'average_satisfaction': 4.5,
          'requires_action': true,
          'at_risk_count': 2
        },
        'global_distribution': [
          {'score': 1, 'count': 2}
        ],
        'themes_analysis': [
          {
            'theme_id': 't1',
            'theme_name': 'Theme 1',
            'average_score': 3.5,
            'satisfaction_percentage': 80.0,
            'requires_action': false,
            'low_score_questions_count': 1,
            'total_questions': 5
          }
        ],
        'questions_analysis': [
          {
            'question_id': 'q1',
            'question_text': 'How are you?',
            'theme_id': 't1',
            'theme_name': 'Theme 1',
            'satisfaction_percentage': 90.0,
            'average_score': 4.0,
            'requires_action': false,
            'total_responses': 10,
            'answers': [
              {'id': 'a1', 'answer': 'Good', 'value': 1, 'numberAnswered': 5}
            ]
          }
        ],
        'questions_requiring_action': [],
        'at_risk_employees': [
          {
            'anonymous_user_id': 'u1',
            'satisfaction_percentage': 50.0,
            'low_scores_count': 2,
            'total_responses': 5,
            'critical_themes': ['Theme 1'],
            'open_answer': 'Needs help'
          }
        ]
      };
      final entity = QvstAnalysisEntity.fromJson(json);
      expect(entity.campaignId, 1);
      expect(entity.campaignName, 'Test');
      expect(entity.campaignStatus, 'active');
      expect(entity.startDate, '2025-01-01');
      expect(entity.endDate, '2025-01-31');
      expect(entity.themes.first, isA<QvstThemeEntity>());
      expect(entity.globalStats?.totalRespondents, 10);
      expect(entity.globalStats?.totalQuestions, 5);
      expect(entity.globalStats?.averageSatisfaction, 4.5);
      expect(entity.globalStats?.requiresAction, true);
      expect(entity.globalStats?.atRiskCount, 2);
      expect(entity.globalDistribution?.first.score, 1);
      expect(entity.globalDistribution?.first.count, 2);
      expect(entity.themesAnalysis?.first.themeId, 't1');
      expect(entity.questionsAnalysis.first.questionId, 'q1');
      expect(entity.questionsAnalysis.first.answers.first.answerId, 'a1');
      expect(entity.atRiskEmployees.first.anonymousUserId, 'u1');
      expect(entity.atRiskEmployees.first.criticalThemes, ['Theme 1']);
      expect(entity.atRiskEmployees.first.openAnswer, 'Needs help');
    });

    test('equality and copyWith', () {
      final entity1 = QvstAnalysisEntity(campaignId: 1);
      final entity2 = entity1.copyWith(campaignName: 'Other');
      expect(entity1, isNot(equals(entity2)));
      expect(entity2.campaignName, 'Other');
    });
  });

  group('GlobalStatsEntity', () {
    test('fromJson parses int from string', () {
      final json = {
        'total_respondents': '42',
        'total_questions': '10',
        'average_satisfaction': 3.2,
        'requires_action': false,
        'at_risk_count': '2'
      };
      final stats = GlobalStatsEntity.fromJson(json);
      expect(stats.totalRespondents, 42);
      expect(stats.totalQuestions, 10);
      expect(stats.averageSatisfaction, 3.2);
      expect(stats.requiresAction, false);
      expect(stats.atRiskCount, 2);
    });
  });

  group('GlobalDistributionEntity', () {
    test('fromJson', () {
      final json = {'score': 5, 'count': 10};
      final dist = GlobalDistributionEntity.fromJson(json);
      expect(dist.score, 5);
      expect(dist.count, 10);
    });
  });

  group('ThemeAnalysisEntity', () {
    test('fromJson', () {
      final json = {
        'theme_id': 't1',
        'theme_name': 'Theme 1',
        'average_score': 3.5,
        'satisfaction_percentage': 80.0,
        'requires_action': true,
        'low_score_questions_count': 1,
        'total_questions': 5
      };
      final theme = ThemeAnalysisEntity.fromJson(json);
      expect(theme.themeId, 't1');
      expect(theme.themeName, 'Theme 1');
      expect(theme.averageScore, 3.5);
      expect(theme.satisfactionPercentage, 80.0);
      expect(theme.requiresAction, true);
      expect(theme.lowScoreQuestionsCount, 1);
      expect(theme.totalQuestions, 5);
    });
  });

  group('QuestionAnalysisEntity', () {
    test('fromJson', () {
      final json = {
        'question_id': 'q1',
        'question_text': 'How are you?',
        'theme_id': 't1',
        'theme_name': 'Theme 1',
        'satisfaction_percentage': 90.0,
        'average_score': 4.0,
        'requires_action': false,
        'total_responses': 10,
        'answers': [
          {'id': 'a1', 'answer': 'Good', 'value': '1', 'numberAnswered': 5}
        ]
      };
      final question = QuestionAnalysisEntity.fromJson(json);
      expect(question.questionId, 'q1');
      expect(question.questionText, 'How are you?');
      expect(question.themeId, 't1');
      expect(question.themeName, 'Theme 1');
      expect(question.satisfactionPercentage, 90.0);
      expect(question.averageScore, 4.0);
      expect(question.requiresAction, false);
      expect(question.totalResponses, 10);
      expect(question.answers.first.answerId, 'a1');
      expect(question.answers.first.answerText, 'Good');
      expect(question.answers.first.score, '1');
      expect(question.answers.first.count, 5);
    });
  });

  group('AnswerDistributionEntity', () {
    test('fromJson', () {
      final json = {
        'id': 'a1',
        'answer': 'Yes',
        'value': '2',
        'numberAnswered': 3
      };
      final answer = AnswerDistributionEntity.fromJson(json);
      expect(answer.answerId, 'a1');
      expect(answer.answerText, 'Yes');
      expect(answer.score, '2');
      expect(answer.count, 3);
    });
  });

  group('AtRiskEmployeeEntity', () {
    test('fromJson', () {
      final json = {
        'anonymous_user_id': 'u1',
        'satisfaction_percentage': 50.0,
        'low_scores_count': 2,
        'total_responses': 5,
        'critical_themes': ['Theme 1'],
        'open_answer': 'Needs help'
      };
      final emp = AtRiskEmployeeEntity.fromJson(json);
      expect(emp.anonymousUserId, 'u1');
      expect(emp.satisfactionPercentage, 50.0);
      expect(emp.lowScoresCount, 2);
      expect(emp.totalResponses, 5);
      expect(emp.criticalThemes, ['Theme 1']);
      expect(emp.openAnswer, 'Needs help');
    });
  });
}
