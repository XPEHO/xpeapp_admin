import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/agenda/events_entity.dart';

class AgendaService {
  final BackendApi _backendApi;
  final String baseUrl;

  AgendaService(
    this._backendApi,
    this.baseUrl,
  );

  Future<List<EventsEntity>> getAllEvents() async {
    final response = await _backendApi.getAllEvents();
    if (response.response.statusCode == 200) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (e) => EventsEntity.fromJson(
              e,
            ),
          )
          .toList();
    } else {
      throw Exception('Erreur lors de la récupération des événements');
    }
  }

  // Future<QvstQuestionEntity> getQvstById(String id) async {
  //   final response = await _backendApi.getQvstById(id);
  //   if (response.response.statusCode == 200) {
  //     final data = response.data as Map<String, dynamic>;
  //     return QvstQuestionEntity.fromJson(
  //       data,
  //     );
  //   } else {
  //     throw Exception('Erreur lors de la récupération du QVST');
  //   }
  // }

  // Future<bool> addQvst(QvstQuestionEntity questionEntity) async {
  //   final response = await _backendApi.addQvst(
  //     questionEntity.toJson(),
  //   );
  //   if (response.response.statusCode == 201) {
  //     return true;
  //   } else {
  //     throw Exception('Erreur lors de l\'ajout du QVST');
  //   }
  // }

  // Future<bool> deleteQvst(String id) async {
  //   final response = await _backendApi.deleteQvst(id);
  //   if (response.response.statusCode == 204) {
  //     return true;
  //   } else {
  //     throw Exception('Erreur lors de la suppression du QVST');
  //   }
  // }

  // Future<bool> updateQvstAnswersRepo(
  //   QvstAnswerRepoEntity qvstAnswerRepoEntity,
  // ) async {
  //   final response = await _backendApi.updateQvstAnswersRepo(
  //     qvstAnswerRepoEntity.id,
  //     qvstAnswerRepoEntity.toJson(),
  //   );
  //   if (response.response.statusCode == 201) {
  //     return true;
  //   } else {
  //     throw Exception('Erreur lors de la mise à jour des réponses');
  //   }
  // }
}
