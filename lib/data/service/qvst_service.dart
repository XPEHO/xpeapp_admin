import 'dart:convert';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_repo_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_campaign_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/stats/qvst_stats_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';

class QvstService {
  final BackendApi _backendApi;

  QvstService(this._backendApi);

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
    required QvstThemeEntity themeSelected,
    required DateTime startDate,
    required DateTime endDate,
    required List<QvstQuestionEntity> questions,
  }) async {
    final campaignJson = {
      'name': campaignName,
      'theme_id': themeSelected.id,
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

  Future<void> importCsv(Uint8List file) async {
    final stringFile = utf8
        .decode(file)
        .split('\n')
        .where((line) => line.isNotEmpty)
        .map((line) => line.split(';'))
        .toList();
    final csvFileJson = <Map<String, dynamic>>[];

    // Note: We try to ensure correct structure of the csv file
    if (!stringFile.every((element) => element.length == 4)) {
      throw Exception('Erreur lors de l\'import du fichier: le fichier doit '
          'contenir 4 colonnes délimitées de \';\'');
    }
    if (int.tryParse(stringFile[0][0]) != null) {
      throw Exception('Erreur lors de l\'import du fichier: la première ligne '
          'doit contenir les noms des colonnes');
    }

    for (var i = 0; i < stringFile.length; i++) {
      csvFileJson.add(
        {
          'id_theme': stringFile[i][0],
          'question': stringFile[i][2],
          'response_repo': stringFile[i][3],
        },
      );
    }

    final body = <String, dynamic>{
      'questions': csvFileJson,
    };

    final response = await _backendApi.importQvstFile(
      body,
    );
    if (response.response.statusCode != 201) {
      throw Exception(
          'Erreur lors de l\'import du fichier: ${response.toString()}');
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
