import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/resume/qvst_resume_entity.dart';
import 'package:xpeapp_admin/data/entities/qvst/theme/qvst_theme_entity.dart';

class QvstService {
  final BackendApi _backendApi;

  QvstService(this._backendApi);

  Future<List<QvstQuestionEntity>> getAllQvst() async {
    final response = await _backendApi.getAllQvst();
    if (response.response.statusCode == 200) {
      final data = Map.from(response.data);
      final List<QvstQuestionEntity> qvstQuestions = [];
      data.forEach(
        (key, value) {
          qvstQuestions.add(
            QvstQuestionEntity.fromJson(value).copyWith(
              id: key,
            ),
          );
        },
      );
      return qvstQuestions;
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

  Future<QvstResumeEntity> getQvstResumeById(String id) async {
    final response = await _backendApi.getQvstResumeById(id);
    if (response.response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return QvstResumeEntity.fromJson(data);
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
}
