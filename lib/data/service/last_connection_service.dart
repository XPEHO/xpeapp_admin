import 'package:xpeapp_admin/data/backend_api.dart';
import '../entities/last_connection_user.dart';

class LastConnectionService {
  final BackendApi _api;

  LastConnectionService(this._api);

  Future<List<LastConnectionUser>> getAllLastConnections() async {
    try {
      final response = await _api.getLastConnexionUsers();
      return (response.data as List)
          .map((e) => LastConnectionUser.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Error fetching ideas: $e');
    }
  }
}
