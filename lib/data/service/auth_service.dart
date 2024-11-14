import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/token.dart';

class AuthService {
  final BackendApi _backendApi;

  AuthService(this._backendApi);

  Future<Token> getToken(String username, String password) async {
    try {
      final response = await _backendApi.getToken(
        {
          'username': username,
          'password': password,
        },
      );
      if (response.response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return Token.fromJson(
          data,
        );
      } else {
        throw Exception('Invalid username or password');
      }
    } catch (e) {
      throw Exception('Invalid username or password');
    }
  }
}
