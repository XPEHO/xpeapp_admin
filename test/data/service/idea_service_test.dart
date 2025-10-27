import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/entities/idea_box/idea_entity.dart';
import 'package:xpeapp_admin/data/service/idea_service.dart';

import 'idea_service_test.mocks.dart';

@GenerateMocks([BackendApi])
void main() {
  late IdeaService ideaService;
  late MockBackendApi mockBackendApi;

  setUpAll(() {
    mockBackendApi = MockBackendApi();
    ideaService = IdeaService(mockBackendApi);
  });

  group('IdeaService test', () {
    group('Ideas', () {
      test('getAllIdeas returns a list of ideas', () async {
        final mockResponse = [
          {
            "id": "1",
            "description": "Test idea 1",
            "context": "Test context 1",
            "status": "pending",
            "created_at": "2024-01-15T10:30:00Z",
          },
          {
            "id": "2",
            "description": "Test idea 2",
            "context": "Test context 2",
            "status": "approved",
            "created_at": "2024-01-15T11:30:00Z",
          },
        ];

        final httpResponse = HttpResponse(
            mockResponse,
            Response(
              requestOptions: RequestOptions(path: '/ideas'),
              statusCode: 200,
            ));

        when(mockBackendApi.getAllIdeas(any, any))
            .thenAnswer((_) async => httpResponse);

        final result = await ideaService.getAllIdeas();

        expect(result, isA<List<IdeaEntity>>());
        expect(result.length, 2);
        expect(result[0].id, "2");
        expect(result[0].description, "Test idea 2");
        expect(result[0].status, "approved");
        expect(result[1].id, "1");
        expect(result[1].description, "Test idea 1");
        expect(result[1].status, "pending");

        verify(mockBackendApi.getAllIdeas(1, null)).called(1);
      });

      test('getAllIdeas handles pagination correctly', () async {
        final mockResponse = [
          {
            "id": "3",
            "description": "Page 2 idea",
            "context": "Test context",
            "status": "pending",
            "created_at": "2024-01-15T12:30:00Z",
          },
        ];

        final httpResponse = HttpResponse(
            mockResponse,
            Response(
              requestOptions: RequestOptions(path: '/ideas'),
              statusCode: 200,
            ));

        when(mockBackendApi.getAllIdeas(any, any))
            .thenAnswer((_) async => httpResponse);

        final result = await ideaService.getAllIdeas(page: 2);

        expect(result, isA<List<IdeaEntity>>());
        expect(result.length, 1);
        expect(result[0].id, "3");

        verify(mockBackendApi.getAllIdeas(2, null)).called(1);
      });

      test('getAllIdeas handles status filter correctly', () async {
        final mockResponse = [
          {
            "id": "4",
            "description": "Approved idea",
            "context": "Test context",
            "status": "approved",
            "created_at": "2024-01-15T13:30:00Z",
          },
        ];

        final httpResponse = HttpResponse(
            mockResponse,
            Response(
              requestOptions: RequestOptions(path: '/ideas'),
              statusCode: 200,
            ));

        when(mockBackendApi.getAllIdeas(any, any))
            .thenAnswer((_) async => httpResponse);

        final result = await ideaService.getAllIdeas(status: 'approved');

        expect(result, isA<List<IdeaEntity>>());
        expect(result.length, 1);
        expect(result[0].status, "approved");

        verify(mockBackendApi.getAllIdeas(1, 'approved')).called(1);
      });

      test('getAllIdeas handles empty response', () async {
        final httpResponse = HttpResponse(
            <Map<String, dynamic>>[],
            Response(
              requestOptions: RequestOptions(path: '/ideas'),
              statusCode: 200,
            ));

        when(mockBackendApi.getAllIdeas(any, any))
            .thenAnswer((_) async => httpResponse);

        final result = await ideaService.getAllIdeas();

        expect(result, isA<List<IdeaEntity>>());
        expect(result, isEmpty);

        verify(mockBackendApi.getAllIdeas(1, null)).called(1);
      });

      test('getAllIdeas throws an exception on error', () async {
        when(mockBackendApi.getAllIdeas(any, any)).thenThrow(DioException(
          requestOptions: RequestOptions(path: '/ideas'),
          response: Response(
            requestOptions: RequestOptions(path: '/ideas'),
            statusCode: 404,
            statusMessage: 'Not Found',
          ),
        ));

        expect(
          () async => await ideaService.getAllIdeas(),
          throwsException,
        );

        verify(mockBackendApi.getAllIdeas(1, null)).called(1);
      });

      test('getAllIdeas throws an exception on network error', () async {
        when(mockBackendApi.getAllIdeas(any, any)).thenThrow(DioException(
          requestOptions: RequestOptions(path: '/ideas'),
          type: DioExceptionType.connectionTimeout,
          message: 'Connection timeout',
        ));

        expect(
          () async => await ideaService.getAllIdeas(),
          throwsException,
        );

        verify(mockBackendApi.getAllIdeas(1, null)).called(1);
      });

      test('getAllIdeas throws an exception on unknown error', () async {
        when(mockBackendApi.getAllIdeas(any, any))
            .thenThrow(Exception('Unknown error'));

        expect(
          () async => await ideaService.getAllIdeas(),
          throwsException,
        );

        verify(mockBackendApi.getAllIdeas(1, null)).called(1);
      });

      test('getAllIdeas handles both page and status parameters', () async {
        final mockResponse = [
          {
            "id": "7",
            "description": "Filtered idea",
            "context": "Test context",
            "status": "rejected",
            "created_at": "2024-01-15T15:30:00Z",
          },
        ];

        final httpResponse = HttpResponse(
            mockResponse,
            Response(
              requestOptions: RequestOptions(path: '/ideas'),
              statusCode: 200,
            ));

        when(mockBackendApi.getAllIdeas(any, any))
            .thenAnswer((_) async => httpResponse);

        final result =
            await ideaService.getAllIdeas(page: 3, status: 'rejected');

        expect(result, isA<List<IdeaEntity>>());
        expect(result.length, 1);
        expect(result[0].id, "7");
        expect(result[0].status, "rejected");

        verify(mockBackendApi.getAllIdeas(3, 'rejected')).called(1);
      });
    });
  });
}
