import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/backend_api_base.dart';
import 'package:xpeapp_admin/data/entities/qvst/analysis/qvst_analysis_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/import/qvst_question_sample.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_campaign_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';
import 'package:xpeapp_admin/data/service/file_service.dart';

class QvstService {
  final BackendApiBase _backendApiBase;
  final BackendApi _backendApi;
  final FileService _fileService;
  final String baseUrl;

  QvstService(
    this._backendApiBase,
    this._backendApi,
    this._fileService,
    this.baseUrl,
  );

  /// Applies question inversions to a QVST analysis and recalculates statistics
  QvstAnalysisEntity applyReversedQuestions(
    QvstAnalysisEntity analysis,
    Map<String, bool> reversedQuestions,
  ) {
    if (reversedQuestions.isEmpty) return analysis;

    // Recalculate ALL analysis questions with their satisfaction percentages
    final updatedQuestionsAnalysis = analysis.questionsAnalysis.map((question) {
      return _applyQuestionInversion(
          question, reversedQuestions[question.questionText] ?? false);
    }).toList();

    // Recalculate questions requiring action (subset with satisfaction < 75%)
    final updatedQuestionsRequiringAction =
        analysis.questionsRequiringAction.map((question) {
      return _applyQuestionInversion(
          question, reversedQuestions[question.questionText] ?? false);
    }).toList();

    // Recalculate at-risk employees with the new satisfaction percentages
    final updatedAtRiskEmployees = analysis.atRiskEmployees.map((employee) {
      return _applyEmployeeInversion(
          employee, reversedQuestions, analysis.questionsAnalysis);
    }).toList();

    // Recalculate global statistics using ALL updated questions
    final updatedGlobalStats =
        _recalculateGlobalStats(analysis.globalStats, updatedQuestionsAnalysis);

    return analysis.copyWith(
      questionsAnalysis: updatedQuestionsAnalysis, // All questions
      questionsRequiringAction: updatedQuestionsRequiringAction, // Subset < 75%
      atRiskEmployees: updatedAtRiskEmployees,
      globalStats: updatedGlobalStats,
    );
  }

  /// Weighted average calculation
  double calculateWeightedAverage(List<AnswerDistributionEntity> answers,
      [bool isReversed = false]) {
    double totalValue = 0;
    int totalResponses = 0;

    for (final answer in answers) {
      final score = answer.score != null ? int.tryParse(answer.score!) : null;
      final count = answer.count;
      if (score != null && count != null) {
        // Inversion is now done at the final percentage level, not the scores
        totalValue += score * count;
        totalResponses += count;
      }
    }

    return totalResponses > 0 ? totalValue / totalResponses : 0;
  }

  /// Applies inversion to a question and recalculates its metrics
  QuestionAnalysisEntity _applyQuestionInversion(
      QuestionAnalysisEntity question, bool isReversed) {
    if (!isReversed) return question;

    // For inversion, we simply invert the satisfaction percentage: 100% - percentage
    final originalPercentage = question.satisfactionPercentage ?? 0.0;
    final newSatisfactionPercentage = 100.0 - originalPercentage;

    return question.copyWith(
      satisfactionPercentage: newSatisfactionPercentage,
      requiresAction: newSatisfactionPercentage < 50,
    );
  }

  /// Recalculates the satisfaction percentage of an at-risk employee
  /// taking into account inverted questions
  AtRiskEmployeeEntity _applyEmployeeInversion(
    AtRiskEmployeeEntity employee,
    Map<String, bool> reversedQuestions,
    List<QuestionAnalysisEntity> allQuestions,
  ) {
    if (reversedQuestions.isEmpty) return employee;

    // Calculate a new satisfaction percentage based on inverted questions
    // This is an approximation since we don't have access to individual answers

    // Count the number of inverted questions
    int totalQuestions = reversedQuestions.length;
    int reversedCount =
        reversedQuestions.values.where((isReversed) => isReversed).length;

    if (totalQuestions == 0 || reversedCount == 0) return employee;

    // If there are inversions, we approximate by inverting the percentage
    // proportionally to the number of inverted questions
    final originalSatisfaction = employee.satisfactionPercentage ?? 0.0;
    final reversedRatio = reversedCount / totalQuestions;

    // Approximate calculation: partially invert according to the ratio of inverted questions
    final newSatisfactionPercentage = originalSatisfaction +
        (100.0 - 2 * originalSatisfaction) * reversedRatio;

    return employee.copyWith(
      satisfactionPercentage: newSatisfactionPercentage.clamp(0.0, 100.0),
    );
  }

  /// Recalculates global statistics based on a list of questions
  GlobalStatsEntity? _recalculateGlobalStats(
    GlobalStatsEntity? originalStats,
    List<QuestionAnalysisEntity> questions,
  ) {
    if (originalStats == null || questions.isEmpty) return originalStats;

    double totalSatisfaction = 0;
    int validQuestions = 0;

    for (final question in questions) {
      if (question.satisfactionPercentage != null) {
        totalSatisfaction += question.satisfactionPercentage!;
        validQuestions++;
      }
    }

    final newAverageSatisfaction = validQuestions > 0
        ? totalSatisfaction / validQuestions
        : originalStats.averageSatisfaction;

    return originalStats.copyWith(
      averageSatisfaction: newAverageSatisfaction,
      requiresAction:
          newAverageSatisfaction != null ? newAverageSatisfaction < 75 : null,
    );
  }

  Future<List<QvstQuestionEntity>> getAllQvst() async {
    final response = await _backendApi.getAllQvst(true);
    if (response.response.statusCode == 200) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (e) => QvstQuestionEntity.fromJson(
              e,
            ),
          )
          .toList();
    } else {
      throw Exception('Erreur lors de la récupération des QVST');
    }
  }

  Future<QvstQuestionEntity> getQvstById(String id) async {
    final response = await _backendApi.getQvstById(id);
    if (response.response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return QvstQuestionEntity.fromJson(
        data,
      );
    } else {
      throw Exception('Erreur lors de la récupération du QVST');
    }
  }

  Future<List<QvstThemeEntity>> getAllQvstThemes() async {
    final response = await _backendApi.getAllQvstThemes();
    if (response.response.statusCode == 200) {
      return (response.data as List<dynamic>)
          .map(
            (e) => QvstThemeEntity.fromJson(e),
          )
          .toList();
    } else {
      throw Exception('Erreur lors de la récupération des thèmes du QVST');
    }
  }

  Future<List<QvstQuestionEntity>> getAllQvstQuestionsByThemeId(
    String id, {
    bool includeNoLongerUsed = false,
  }) async {
    final response = await _backendApi.getAllQvstQuestionsByThemeId(
      id,
      includeNoLongerUsed,
    );
    if (response.response.statusCode == 200) {
      return (response.data as List<dynamic>)
          .map(
            (e) => QvstQuestionEntity.fromJson(e),
          )
          .toList();
    } else {
      throw Exception('Erreur lors de la récupération des questions du QVST');
    }
  }

  Future<bool> addQvst(QvstQuestionEntity questionEntity) async {
    final response = await _backendApi.addQvst(
      questionEntity.toJson(),
    );
    if (response.response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Erreur lors de l\'ajout du QVST');
    }
  }

  Future<bool> deleteQvst(String id) async {
    final response = await _backendApi.deleteQvst(id);
    if (response.response.statusCode == 204) {
      return true;
    } else {
      throw Exception('Erreur lors de la suppression du QVST');
    }
  }

  Future<List<QvstAnswerRepoEntity>> getQvstAnswersRepo() async {
    final response = await _backendApi.getQvstAnswersRepo();
    if (response.response.statusCode == 200) {
      return (response.data as List<dynamic>)
          .map(
            (e) => QvstAnswerRepoEntity.fromJson(e),
          )
          .toList();
    } else {
      throw Exception('Erreur lors de la récupération des réponses');
    }
  }

  Future<bool> updateQvstAnswersRepo(
    QvstAnswerRepoEntity qvstAnswerRepoEntity,
  ) async {
    final response = await _backendApi.updateQvstAnswersRepo(
      qvstAnswerRepoEntity.id,
      qvstAnswerRepoEntity.toJson(),
    );
    if (response.response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Erreur lors de la mise à jour des réponses');
    }
  }

  Future<bool> addQvstAnswersRepo(
    QvstAnswerRepoEntity qvstAnswerRepoEntity,
  ) async {
    final response = await _backendApi.addQvstAnswersRepo(
      qvstAnswerRepoEntity.toJson(),
    );
    if (response.response.statusCode == 200 ||
        response.response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Erreur lors de la création du référentiel');
    }
  }

  Future<List<QvstCampaignEntity>> getAllQvstCampaigns() async {
    final response = await _backendApi.getAllQvstCampaigns();
    if (response.response.statusCode == 200) {
      return (response.data as List<dynamic>)
          .map(
            (e) => QvstCampaignEntity.fromJson(e),
          )
          .toList();
    } else {
      throw Exception('Erreur lors de la récupération des campagnes');
    }
  }

  Future<bool> addQvstCampaign({
    required String campaignName,
    required List<QvstThemeEntity> themesSelected,
    required DateTime startDate,
    required DateTime endDate,
    required List<QvstQuestionEntity> questions,
  }) async {
    final campaignJson = {
      'name': campaignName,
      'themes': themesSelected.map((theme) => theme.id).toList(),
      'start_date': DateFormat('yyyy-MM-dd').format(startDate),
      'end_date': DateFormat('yyyy-MM-dd').format(endDate),
      'questions': questions
          .map(
            (e) => {
              "id": e.id,
            },
          )
          .toList(),
    };
    final response = await _backendApi.addQvstCampaign(
      campaignJson,
    );
    if (response.response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Erreur lors de l\'ajout de la campagne');
    }
  }

  Future<bool> updateQvst(String id, Map<String, dynamic> qvstJson) async {
    final response = await _backendApi.updateQvst(
      id,
      qvstJson,
    );
    if (response.response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Erreur lors de la mise à jour du QVST');
    }
  }

  Future<void> importCsv(Uint8List csvFile) async {
    final csvFileContent = utf8.decode(csvFile);
    final sampleFileLines = csvFileContent
        .split('\n')
        .where((line) => line.isNotEmpty)
        .skip(1) // Skip the first line because it contains the column names
        .map((line) => QvstQuestionSample.fromCsvLine(line))
        .toList();

    final jsonFile = sampleFileLines.map((line) {
      return line.toJson();
    }).toList();

    final body = <String, dynamic>{
      'questions': jsonFile,
    };

    final response = await _backendApi.importQvstFile(
      body,
    );
    if (response.response.statusCode != 201) {
      throw Exception(
          'Erreur lors de l\'import du fichier: ${response.toString()}');
    }
  }

  Future<void> exportCSVFile(String campaignId, String token) async {
    final response = await _backendApiBase.fetchQvstStatsCsv(campaignId, token);

    if (response.statusCode == 200) {
      _fileService.downloadFile('text/csv', response.bodyBytes);
    } else if (response.statusCode == 500) {
      throw Exception('Erreur pas de données à exporter');
    } else {
      throw Exception('Erreur lors de l\'export des données: ${response.body}');
    }
  }

  /// Exporte toutes les questions QVST en CSV
  Future<void> exportAllQvstQuestions(String token) async {
    final response = await _backendApiBase.exportQvstQuestionsCsv(token);

    if (response.statusCode == 200) {
      _fileService.downloadFile('text/csv', response.bodyBytes);
    } else if (response.statusCode == 500) {
      throw Exception('Erreur pas de données à exporter');
    } else {
      throw Exception(
          'Erreur lors de l\'export des questions: ${response.body}');
    }
  }

  Future<QvstStatsEntity> getQvstCampaignStatsById(String id) async {
    final response = await _backendApi.getQvstCampaignStatsById(id);
    if (response.response.statusCode == 200) {
      return QvstStatsEntity.fromJson(
        response.data as Map<String, dynamic>,
      );
    } else {
      throw Exception('Erreur lors de la récupération des stats');
    }
  }

  Future<QvstAnalysisEntity> getQvstCampaignAnalysisById(String id) async {
    final response = await _backendApi.getQvstCampaignAnalysisById(id);
    if (response.response.statusCode == 200) {
      return QvstAnalysisEntity.fromJson(
        response.data as Map<String, dynamic>,
      );
    } else {
      throw Exception('Erreur lors de la récupération de l\'analyse');
    }
  }

  Future<bool> updateStatusOfCampaign({
    required String id,
    required String status,
    String? action,
  }) async {
    final response = await _backendApi.updateQvstCampaignStatus(
      id,
      {
        'status': status,
        'action': action,
      },
    );
    if (response.response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Erreur lors de la mise à jour du statut de la campagne');
    }
  }

  /// Met à jour les propriétés d'une question QVST (reversed_question, no_longer_used)
  Future<bool> updateQvstQuestion({
    required String questionId,
    bool? reversedQuestion,
    bool? noLongerUsed,
    String? questionText,
  }) async {
    final Map<String, dynamic> body = {};
    if (reversedQuestion != null) {
      body['reversed_question'] = reversedQuestion;
    }
    if (noLongerUsed != null) {
      body['no_longer_used'] = noLongerUsed;
    }
    if (questionText != null) {
      body['question'] = questionText;
    }
    final response = await _backendApi.updateQvst(questionId, body);
    if (response.response.statusCode == 200 ||
        response.response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Erreur lors de la mise à jour de la question');
    }
  }
}
