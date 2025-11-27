import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';

part 'qvst_analysis_entity.freezed.dart';
part 'qvst_analysis_entity.g.dart';

// Helper function pour parser les valeurs numériques qui peuvent être des strings
int? _parseInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  if (value is double) return value.round();
  return null;
}

@freezed
class QvstAnalysisEntity with _$QvstAnalysisEntity {
  const factory QvstAnalysisEntity({
    @JsonKey(name: 'campaign_id') int? campaignId,
    @JsonKey(name: 'campaign_name', defaultValue: '')
    @Default('')
    String campaignName,
    @JsonKey(name: 'campaign_status', defaultValue: '')
    @Default('')
    String campaignStatus,
    @JsonKey(name: 'start_date', defaultValue: '')
    @Default('')
    String startDate,
    @JsonKey(name: 'end_date', defaultValue: '') @Default('') String endDate,
    @JsonKey(name: 'themes') @Default([]) List<QvstThemeEntity> themes,
    @JsonKey(name: 'global_stats') GlobalStatsEntity? globalStats,
    @JsonKey(name: 'global_distribution')
    @Default([])
    List<GlobalDistributionEntity>? globalDistribution,
    @JsonKey(name: 'themes_analysis')
    @Default([])
    List<ThemeAnalysisEntity>? themesAnalysis,
    @JsonKey(name: 'questions_analysis')
    @Default([])
    List<QuestionAnalysisEntity> questionsAnalysis,
    @JsonKey(name: 'questions_requiring_action')
    @Default([])
    List<QuestionAnalysisEntity> questionsRequiringAction,
    @JsonKey(name: 'at_risk_employees')
    @Default([])
    List<AtRiskEmployeeEntity> atRiskEmployees,
  }) = _QvstAnalysisEntity;

  factory QvstAnalysisEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstAnalysisEntityFromJson(json);
}

@freezed
class GlobalStatsEntity with _$GlobalStatsEntity {
  const factory GlobalStatsEntity({
    @JsonKey(name: 'total_respondents', fromJson: _parseInt)
    int? totalRespondents,
    @JsonKey(name: 'total_questions', fromJson: _parseInt) int? totalQuestions,
    @JsonKey(name: 'average_satisfaction') double? averageSatisfaction,
    @JsonKey(name: 'requires_action') bool? requiresAction,
    @JsonKey(name: 'at_risk_count', fromJson: _parseInt) int? atRiskCount,
  }) = _GlobalStatsEntity;

  factory GlobalStatsEntity.fromJson(Map<String, dynamic> json) =>
      _$GlobalStatsEntityFromJson(json);
}

@freezed
class GlobalDistributionEntity with _$GlobalDistributionEntity {
  const factory GlobalDistributionEntity({
    int? score,
    int? count,
  }) = _GlobalDistributionEntity;

  factory GlobalDistributionEntity.fromJson(Map<String, dynamic> json) =>
      _$GlobalDistributionEntityFromJson(json);
}

@freezed
class ThemeAnalysisEntity with _$ThemeAnalysisEntity {
  const factory ThemeAnalysisEntity({
    @JsonKey(name: 'theme_id', defaultValue: '') @Default('') String themeId,
    @JsonKey(name: 'theme_name', defaultValue: '')
    @Default('')
    String themeName,
    @JsonKey(name: 'average_score') double? averageScore,
    @JsonKey(name: 'satisfaction_percentage') double? satisfactionPercentage,
    @JsonKey(name: 'requires_action') bool? requiresAction,
    @JsonKey(name: 'low_score_questions_count') int? lowScoreQuestionsCount,
    @JsonKey(name: 'total_questions') int? totalQuestions,
  }) = _ThemeAnalysisEntity;

  factory ThemeAnalysisEntity.fromJson(Map<String, dynamic> json) =>
      _$ThemeAnalysisEntityFromJson(json);
}

@freezed
class QuestionAnalysisEntity with _$QuestionAnalysisEntity {
  const factory QuestionAnalysisEntity({
    @JsonKey(name: 'question_id', defaultValue: '')
    @Default('')
    String questionId,
    @JsonKey(name: 'question_text', defaultValue: '')
    @Default('')
    String questionText,
    @JsonKey(name: 'theme_id') String? themeId,
    @JsonKey(name: 'theme_name') String? themeName,
    @JsonKey(name: 'satisfaction_percentage') double? satisfactionPercentage,
    @JsonKey(name: 'average_score') double? averageScore,
    @JsonKey(name: 'requires_action') bool? requiresAction,
    @JsonKey(name: 'total_responses') int? totalResponses,
    @JsonKey(name: 'answers')
    @Default([])
    List<AnswerDistributionEntity> answers,
  }) = _QuestionAnalysisEntity;

  factory QuestionAnalysisEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnalysisEntityFromJson(json);
}

@freezed
class AnswerDistributionEntity with _$AnswerDistributionEntity {
  const factory AnswerDistributionEntity({
    @JsonKey(name: 'id', defaultValue: '') @Default('') String answerId,
    @JsonKey(name: 'answer', defaultValue: '') @Default('') String answerText,
    @JsonKey(name: 'value', fromJson: _parseInt) int? score,
    @JsonKey(name: 'numberAnswered', fromJson: _parseInt) int? count,
  }) = _AnswerDistributionEntity;

  factory AnswerDistributionEntity.fromJson(Map<String, dynamic> json) =>
      _$AnswerDistributionEntityFromJson(json);
}

@freezed
class AtRiskEmployeeEntity with _$AtRiskEmployeeEntity {
  const factory AtRiskEmployeeEntity({
    @JsonKey(name: 'anonymous_user_id', defaultValue: '')
    @Default('')
    String anonymousUserId,
    @JsonKey(name: 'satisfaction_percentage') double? satisfactionPercentage,
    @JsonKey(name: 'low_scores_count') int? lowScoresCount,
    @JsonKey(name: 'total_responses') int? totalResponses,
    @JsonKey(name: 'critical_themes') @Default([]) List<String>? criticalThemes,
    @JsonKey(name: 'open_answer') String? openAnswer,
  }) = _AtRiskEmployeeEntity;

  factory AtRiskEmployeeEntity.fromJson(Map<String, dynamic> json) =>
      _$AtRiskEmployeeEntityFromJson(json);
}
