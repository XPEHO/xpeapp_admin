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

      test('getAllIdeas throws exception when status code is not 200',
          () async {
        final httpResponse = HttpResponse(
            null,
            Response(
              requestOptions: RequestOptions(path: '/ideas'),
              statusCode: 500,
              statusMessage: 'Internal Server Error',
            ));

        when(mockBackendApi.getAllIdeas(any, any))
            .thenAnswer((_) async => httpResponse);

        expect(
          () async => await ideaService.getAllIdeas(),
          throwsException,
        );

        verify(mockBackendApi.getAllIdeas(1, null)).called(1);
      });

      test('getAllIdeas handles response data wrapped in data field', () async {
        final mockResponse = {
          "data": [
            {
              "id": "1",
              "description": "Test idea",
              "context": "Test context",
              "status": "pending",
              "created_at": "2024-01-15T10:30:00Z",
            }
          ]
        };

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
        expect(result.length, 1);
        expect(result[0].id, "1");

        verify(mockBackendApi.getAllIdeas(1, null)).called(1);
      });
    });

    group('getIdeaById', () {
      test('getIdeaById returns an idea', () async {
        final mockResponse = {
          "id": "1",
          "description": "Test idea",
          "context": "Test context",
          "status": "pending",
          "created_at": "2024-01-15T10:30:00Z",
        };

        final httpResponse = HttpResponse(
            mockResponse,
            Response(
              requestOptions: RequestOptions(path: '/ideas/1'),
              statusCode: 200,
            ));

        when(mockBackendApi.getIdeaById(any))
            .thenAnswer((_) async => httpResponse);

        final result = await ideaService.getIdeaById('1');

        expect(result, isA<IdeaEntity>());
        expect(result.id, "1");
        expect(result.description, "Test idea");
        expect(result.status, "pending");

        verify(mockBackendApi.getIdeaById('1')).called(1);
      });

      test('getIdeaById throws an exception on error', () async {
        when(mockBackendApi.getIdeaById(any)).thenThrow(DioException(
          requestOptions: RequestOptions(path: '/ideas/1'),
          response: Response(
            requestOptions: RequestOptions(path: '/ideas/1'),
            statusCode: 404,
            statusMessage: 'Not Found',
          ),
        ));

        expect(
          () async => await ideaService.getIdeaById('1'),
          throwsException,
        );

        verify(mockBackendApi.getIdeaById('1')).called(1);
      });

      test('getIdeaById throws exception when status code is not 200',
          () async {
        final httpResponse = HttpResponse(
            null,
            Response(
              requestOptions: RequestOptions(path: '/ideas/1'),
              statusCode: 500,
              statusMessage: 'Internal Server Error',
            ));

        when(mockBackendApi.getIdeaById(any))
            .thenAnswer((_) async => httpResponse);

        expect(
          () async => await ideaService.getIdeaById('1'),
          throwsException,
        );

        verify(mockBackendApi.getIdeaById('1')).called(1);
      });
    });

    group('addIdea', () {
      test('addIdea returns the created idea', () async {
        final newIdea = IdeaEntity(
          id: "new-id",
          description: "New idea",
          context: "New context",
          status: "pending",
          createdAt: DateTime.parse("2024-01-15T10:30:00Z"),
        );

        final mockResponse = {
          "id": "new-id",
          "description": "New idea",
          "context": "New context",
          "status": "pending",
          "created_at": "2024-01-15T10:30:00Z",
        };

        final httpResponse = HttpResponse(
            mockResponse,
            Response(
              requestOptions: RequestOptions(path: '/ideas'),
              statusCode: 201,
            ));

        when(mockBackendApi.addIdea(any)).thenAnswer((_) async => httpResponse);

        final result = await ideaService.addIdea(newIdea);

        expect(result, isA<IdeaEntity>());
        expect(result.id, "new-id");
        expect(result.description, "New idea");
        expect(result.status, "pending");

        verify(mockBackendApi.addIdea(any)).called(1);
      });

      test('addIdea throws an exception on error', () async {
        final newIdea = IdeaEntity(
          id: "new-id",
          description: "New idea",
          context: "New context",
          status: "pending",
          createdAt: DateTime.parse("2024-01-15T10:30:00Z"),
        );

        when(mockBackendApi.addIdea(any)).thenThrow(DioException(
          requestOptions: RequestOptions(path: '/ideas'),
          response: Response(
            requestOptions: RequestOptions(path: '/ideas'),
            statusCode: 400,
            statusMessage: 'Bad Request',
          ),
        ));

        expect(
          () async => await ideaService.addIdea(newIdea),
          throwsException,
        );

        verify(mockBackendApi.addIdea(any)).called(1);
      });

      test('addIdea throws exception when status code is not 201', () async {
        final newIdea = IdeaEntity(
          id: "new-id",
          description: "New idea",
          context: "New context",
          status: "pending",
          createdAt: DateTime.parse("2024-01-15T10:30:00Z"),
        );

        final httpResponse = HttpResponse(
            null,
            Response(
              requestOptions: RequestOptions(path: '/ideas'),
              statusCode: 500,
              statusMessage: 'Internal Server Error',
            ));

        when(mockBackendApi.addIdea(any)).thenAnswer((_) async => httpResponse);

        expect(
          () async => await ideaService.addIdea(newIdea),
          throwsException,
        );

        verify(mockBackendApi.addIdea(any)).called(1);
      });
    });

    group('updateIdeaStatus', () {
      test('updateIdeaStatus completes successfully', () async {
        final httpResponse = HttpResponse(
            null,
            Response(
              requestOptions: RequestOptions(path: '/ideas/1/status'),
              statusCode: 204,
            ));

        when(mockBackendApi.updateIdeaStatus(any, any))
            .thenAnswer((_) async => httpResponse);

        await ideaService.updateIdeaStatus('1', 'approved');

        verify(mockBackendApi.updateIdeaStatus('1', {'status': 'approved'}))
            .called(1);
      });

      test('updateIdeaStatus throws an exception on error', () async {
        final httpResponse = HttpResponse(
            null,
            Response(
              requestOptions: RequestOptions(path: '/ideas/1/status'),
              statusCode: 400,
            ));

        when(mockBackendApi.updateIdeaStatus(any, any))
            .thenAnswer((_) async => httpResponse);

        expect(
          () async => await ideaService.updateIdeaStatus('1', 'approved'),
          throwsException,
        );

        verify(mockBackendApi.updateIdeaStatus('1', {'status': 'approved'}))
            .called(1);
      });
    });
  });
}
