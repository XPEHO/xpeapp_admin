import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:xpeapp_admin/data/entities/last_connection_user.dart';
import 'package:mockito/mockito.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/service/last_connection_service.dart';

import 'last_connection_service_test.mocks.dart';

@GenerateMocks([BackendApi])
void main() {
  group('LastConnectionService', () {
    late MockBackendApi mockApi;
    late LastConnectionService service;

    setUp(() {
      mockApi = MockBackendApi();
      service = LastConnectionService(mockApi);
    });

    test('returns list of LastConnectionUser on success', () async {
      final mockJson = [
        {
          'last_connection': '2025-12-30T15:49:23',
          'first_name': 'test_user',
          'last_name': 'user_lastname',
        },
      ];
      final response = Response(
        data: mockJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );
      final httpResponse = HttpResponse(response.data, response);
      when(mockApi.getLastConnexionUsers())
          .thenAnswer((_) async => httpResponse);

      final result = await service.getAllLastConnections();
      expect(result, isA<List<LastConnectionUser>>());
      expect(result.first.firstname, 'test_user');
      expect(result.first.lastname, 'user_lastname');
      expect(result.first.lastConnexion.year, 2025);
    });

    test('throws exception on error', () async {
      when(mockApi.getLastConnexionUsers()).thenThrow(Exception('API error'));
      expect(() => service.getAllLastConnections(), throwsException);
    });
  });
}
