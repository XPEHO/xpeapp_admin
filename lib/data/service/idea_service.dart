import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/idea_box/idea_entity.dart';

class IdeaService {
  final BackendApi _api;

  IdeaService(this._api);

  Future<List<IdeaEntity>> getAllIdeas({int page = 1, String? status}) async {
    try {
      final response = await _api.getAllIdeas(page, status);

      if (response.response.statusCode == 200) {
        final List<dynamic> data =
            response.data is List ? response.data : response.data['data'] ?? [];
        final ideas = data.map((json) => IdeaEntity.fromJson(json)).toList();

        return ideas;
      } else {
        throw Exception(
            'Failed to load ideas: ${response.response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching ideas: $e');
    }
  }

  Future<IdeaEntity> getIdeaById(String id) async {
    try {
      final response = await _api.getIdeaById(id);

      if (response.response.statusCode == 200) {
        return IdeaEntity.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load idea: ${response.response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching idea: $e');
    }
  }

  Future<IdeaEntity> addIdea(IdeaEntity idea) async {
    try {
      final response = await _api.addIdea(idea.toJson());

      if (response.response.statusCode == 201) {
        return IdeaEntity.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to add idea: ${response.response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error adding idea: $e');
    }
  }

  Future<void> updateIdeaStatus(String id, String newStatus) async {
    final response = await _api.updateIdeaStatus(id, {'status': newStatus});
    if (response.response.statusCode != 204) {
      throw Exception('Erreur lors de la mise à jour du statut de l\'idée');
    }
  }
}
