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

  /// Applique les inversions de questions à une analyse QVST et recalcule les statistiques
  QvstAnalysisEntity applyReversedQuestions(
    QvstAnalysisEntity analysis,
    Map<String, bool> reversedQuestions,
  ) {
    if (reversedQuestions.isEmpty) return analysis;

    // Recalculer TOUTES les questions d'analyse avec leurs pourcentages de satisfaction
    final updatedQuestionsAnalysis = analysis.questionsAnalysis.map((question) {
      return _applyQuestionInversion(
          question, reversedQuestions[question.questionText] ?? false);
    }).toList();

    // Recalculer les questions nécessitant une action (sous-ensemble avec satisfaction < 75%)
    final updatedQuestionsRequiringAction =
        analysis.questionsRequiringAction.map((question) {
      return _applyQuestionInversion(
          question, reversedQuestions[question.questionText] ?? false);
    }).toList();

    // Recalculer les collaborateurs à risque avec les nouveaux pourcentages de satisfaction
    final updatedAtRiskEmployees = analysis.atRiskEmployees.map((employee) {
      return _applyEmployeeInversion(
          employee, reversedQuestions, analysis.questionsAnalysis);
    }).toList();

    // Recalculer les statistiques globales en utilisant TOUTES les questions mises à jour
    final updatedGlobalStats =
        _recalculateGlobalStats(analysis.globalStats, updatedQuestionsAnalysis);

    return analysis.copyWith(
      questionsAnalysis: updatedQuestionsAnalysis, // TOUTES les questions
      questionsRequiringAction:
          updatedQuestionsRequiringAction, // Sous-ensemble < 75%
      atRiskEmployees: updatedAtRiskEmployees,
      globalStats: updatedGlobalStats,
    );
  }

  /// Calcul de moyenne pondérée
  double calculateWeightedAverage(List<AnswerDistributionEntity> answers,
      [bool isReversed = false]) {
    double totalValue = 0;
    int totalResponses = 0;

    for (final answer in answers) {
      if (answer.score != null && answer.count != null) {
        int value = answer.score!;
        // L'inversion se fait maintenant au niveau du pourcentage final, pas des scores
        totalValue += value * answer.count!;
        totalResponses += answer.count!;
      }
    }

    return totalResponses > 0 ? totalValue / totalResponses : 0;
  }

  /// Applique l'inversion à une question et recalcule ses métriques
  QuestionAnalysisEntity _applyQuestionInversion(
      QuestionAnalysisEntity question, bool isReversed) {
    if (!isReversed) return question;

    // Pour l'inversion, on inverse simplement le pourcentage de satisfaction : 100% - pourcentage
    final originalPercentage = question.satisfactionPercentage ?? 0.0;
    final newSatisfactionPercentage = 100.0 - originalPercentage;

    return question.copyWith(
      satisfactionPercentage: newSatisfactionPercentage,
      requiresAction: newSatisfactionPercentage < 50,
    );
  }

  /// Recalcule le pourcentage de satisfaction d'un collaborateur à risque
  /// en tenant compte des questions inversées
  AtRiskEmployeeEntity _applyEmployeeInversion(
    AtRiskEmployeeEntity employee,
    Map<String, bool> reversedQuestions,
    List<QuestionAnalysisEntity> allQuestions,
  ) {
    if (reversedQuestions.isEmpty) return employee;

    // Calculer un nouveau pourcentage de satisfaction basé sur les questions inversées
    // Ceci est une approximation car nous n'avons pas accès aux réponses individuelles

    // Compter le nombre de questions inversées
    int totalQuestions = reversedQuestions.length;
    int reversedCount =
        reversedQuestions.values.where((isReversed) => isReversed).length;

    if (totalQuestions == 0 || reversedCount == 0) return employee;

    // Si il y a des inversions, nous faisons une approximation en inversant le pourcentage
    // proportionnellement au nombre de questions inversées
    final originalSatisfaction = employee.satisfactionPercentage ?? 0.0;
    final reversedRatio = reversedCount / totalQuestions;

    // Calcul approximatif : inverse partiellement selon le ratio de questions inversées
    final newSatisfactionPercentage = originalSatisfaction +
        (100.0 - 2 * originalSatisfaction) * reversedRatio;

    return employee.copyWith(
      satisfactionPercentage: newSatisfactionPercentage.clamp(0.0, 100.0),
    );
  }

  /// Recalcule les statistiques globales basées sur une liste de questions
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
    final response = await _backendApi.getAllQvst();
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
      String id) async {
    final response = await _backendApi.getAllQvstQuestionsByThemeId(id);
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
}
