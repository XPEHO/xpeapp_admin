import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/token.dart';
import 'package:xpeapp_admin/data/service/auth_service.dart';

import 'auth_service_test.mocks.dart';

@GenerateMocks([
  BackendApi,
])
void main() {
  late AuthService authService;
  late MockBackendApi mockBackendApi;

  setUpAll(() {
    mockBackendApi = MockBackendApi();
    authService = AuthService(mockBackendApi);
  });

  group('AuthService test', () {
    group('getToken()', () {
      test('Success', () async {
        const username = 'testuser';
        const password = 'testpassword';

        Map<String, dynamic> response = {
          "token": "testtoken",
          "user_email": "testemail",
          "user_nicename": "testnicename",
          "user_display_name": "testdisplayname",
        };

        when(mockBackendApi.getToken({
          'username': username,
          'password': password,
        })).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              response,
              Response(
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        final result = await authService.getToken(username, password);

        expect(Token.fromJson(response).token, "testtoken");
        expect(result.token, Token.fromJson(response).token);
      });

      test('Failed with invalid credentials', () async {
        const username = 'testuser';
        const password = 'wrongpassword';

        when(mockBackendApi.getToken({
          'username': username,
          'password': password,
        })).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 401,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () => authService.getToken(username, password),
          throwsException,
        );
      });

      test('Failed with server error', () async {
        const username = 'testuser';
        const password = 'testpassword';

        when(mockBackendApi.getToken({
          'username': username,
          'password': password,
        })).thenAnswer((_) async {
          return Future.value(
            HttpResponse(
              {},
              Response(
                statusCode: 500,
                requestOptions: RequestOptions(path: ''),
              ),
            ),
          );
        });

        expect(
          () => authService.getToken(username, password),
          throwsException,
        );
      });
    });
  });
}
