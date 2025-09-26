import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/backend_api_base.dart';
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
      throw Exception(
          'Erreur lors de la récupération des stats - Status: ${response.response.statusCode}');
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
