// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qvst_analysis_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QvstAnalysisEntityImpl _$$QvstAnalysisEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QvstAnalysisEntityImpl(
      campaignId: (json['campaign_id'] as num?)?.toInt(),
      campaignName: json['campaign_name'] as String? ?? '',
      campaignStatus: json['campaign_status'] as String? ?? '',
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      themes: (json['themes'] as List<dynamic>?)
              ?.map((e) => QvstThemeEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      globalStats: json['global_stats'] == null
          ? null
          : GlobalStatsEntity.fromJson(
              json['global_stats'] as Map<String, dynamic>),
      globalDistribution: (json['global_distribution'] as List<dynamic>?)
              ?.map((e) =>
                  GlobalDistributionEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      themesAnalysis: (json['themes_analysis'] as List<dynamic>?)
              ?.map((e) =>
                  ThemeAnalysisEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      questionsAnalysis: (json['questions_analysis'] as List<dynamic>?)
              ?.map((e) =>
                  QuestionAnalysisEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      questionsRequiringAction: (json['questions_requiring_action']
                  as List<dynamic>?)
              ?.map((e) =>
                  QuestionAnalysisEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      atRiskEmployees: (json['at_risk_employees'] as List<dynamic>?)
              ?.map((e) =>
                  AtRiskEmployeeEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$QvstAnalysisEntityImplToJson(
        _$QvstAnalysisEntityImpl instance) =>
    <String, dynamic>{
      'campaign_id': instance.campaignId,
      'campaign_name': instance.campaignName,
      'campaign_status': instance.campaignStatus,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'themes': instance.themes,
      'global_stats': instance.globalStats,
      'global_distribution': instance.globalDistribution,
      'themes_analysis': instance.themesAnalysis,
      'questions_analysis': instance.questionsAnalysis,
      'questions_requiring_action': instance.questionsRequiringAction,
      'at_risk_employees': instance.atRiskEmployees,
    };

_$GlobalStatsEntityImpl _$$GlobalStatsEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalStatsEntityImpl(
      totalRespondents: (json['total_respondents'] as num?)?.toInt(),
      totalQuestions: (json['total_questions'] as num?)?.toInt(),
      averageSatisfaction: (json['average_satisfaction'] as num?)?.toDouble(),
      requiresAction: json['requires_action'] as bool?,
      atRiskCount: (json['at_risk_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GlobalStatsEntityImplToJson(
        _$GlobalStatsEntityImpl instance) =>
    <String, dynamic>{
      'total_respondents': instance.totalRespondents,
      'total_questions': instance.totalQuestions,
      'average_satisfaction': instance.averageSatisfaction,
      'requires_action': instance.requiresAction,
      'at_risk_count': instance.atRiskCount,
    };

_$GlobalDistributionEntityImpl _$$GlobalDistributionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalDistributionEntityImpl(
      score: (json['score'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GlobalDistributionEntityImplToJson(
        _$GlobalDistributionEntityImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
      'count': instance.count,
    };

_$ThemeAnalysisEntityImpl _$$ThemeAnalysisEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ThemeAnalysisEntityImpl(
      themeId: json['theme_id'] as String? ?? '',
      themeName: json['theme_name'] as String? ?? '',
      averageScore: (json['average_score'] as num?)?.toDouble(),
      satisfactionPercentage:
          (json['satisfaction_percentage'] as num?)?.toDouble(),
      requiresAction: json['requires_action'] as bool?,
      lowScoreQuestionsCount:
          (json['low_score_questions_count'] as num?)?.toInt(),
      totalQuestions: (json['total_questions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ThemeAnalysisEntityImplToJson(
        _$ThemeAnalysisEntityImpl instance) =>
    <String, dynamic>{
      'theme_id': instance.themeId,
      'theme_name': instance.themeName,
      'average_score': instance.averageScore,
      'satisfaction_percentage': instance.satisfactionPercentage,
      'requires_action': instance.requiresAction,
      'low_score_questions_count': instance.lowScoreQuestionsCount,
      'total_questions': instance.totalQuestions,
    };

_$QuestionAnalysisEntityImpl _$$QuestionAnalysisEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionAnalysisEntityImpl(
      questionId: json['question_id'] as String? ?? '',
      questionText: json['question_text'] as String? ?? '',
      themeId: json['theme_id'] as String?,
      themeName: json['theme_name'] as String?,
      satisfactionPercentage:
          (json['satisfaction_percentage'] as num?)?.toDouble(),
      averageScore: (json['average_score'] as num?)?.toDouble(),
      requiresAction: json['requires_action'] as bool?,
      totalResponses: (json['total_responses'] as num?)?.toInt(),
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) =>
                  AnswerDistributionEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$QuestionAnalysisEntityImplToJson(
        _$QuestionAnalysisEntityImpl instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'question_text': instance.questionText,
      'theme_id': instance.themeId,
      'theme_name': instance.themeName,
      'satisfaction_percentage': instance.satisfactionPercentage,
      'average_score': instance.averageScore,
      'requires_action': instance.requiresAction,
      'total_responses': instance.totalResponses,
      'answers': instance.answers,
    };

_$AnswerDistributionEntityImpl _$$AnswerDistributionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AnswerDistributionEntityImpl(
      answerId: json['id'] as String? ?? '',
      answerText: json['answer'] as String? ?? '',
      score: json['value'] as String?,
      count: (json['numberAnswered'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AnswerDistributionEntityImplToJson(
        _$AnswerDistributionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.answerId,
      'answer': instance.answerText,
      'value': instance.score,
      'numberAnswered': instance.count,
    };

_$AtRiskEmployeeEntityImpl _$$AtRiskEmployeeEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AtRiskEmployeeEntityImpl(
      anonymousUserId: json['anonymous_user_id'] as String? ?? '',
      satisfactionPercentage:
          (json['satisfaction_percentage'] as num?)?.toDouble(),
      lowScoresCount: (json['low_scores_count'] as num?)?.toInt(),
      totalResponses: (json['total_responses'] as num?)?.toInt(),
      criticalThemes: (json['critical_themes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      openAnswer: json['open_answer'] as String?,
    );

Map<String, dynamic> _$$AtRiskEmployeeEntityImplToJson(
        _$AtRiskEmployeeEntityImpl instance) =>
    <String, dynamic>{
      'anonymous_user_id': instance.anonymousUserId,
      'satisfaction_percentage': instance.satisfactionPercentage,
      'low_scores_count': instance.lowScoresCount,
      'total_responses': instance.totalResponses,
      'critical_themes': instance.criticalThemes,
      'open_answer': instance.openAnswer,
    };
