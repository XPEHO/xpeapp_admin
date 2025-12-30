import 'package:xpeapp_admin/data/backend_api.dart';
import '../entities/last_connexion_user.dart';

class LastConnexionService {
  final BackendApi _api;

  LastConnexionService(this._api);

  Future<List<LastConnexionUser>> getAllLastConnections() async {
    try {
      final response = await _api.getLastConnexionUsers();
      return (response.data as List)
          .map((e) => LastConnexionUser.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Error fetching ideas: $e');
    }
  }
}
