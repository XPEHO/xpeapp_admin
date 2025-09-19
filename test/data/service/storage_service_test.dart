import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:xpeapp_admin/data/service/storage_service.dart';
import 'package:http_parser/http_parser.dart';

import 'storage_service_test.mocks.dart';

@GenerateMocks([BackendApi])
void main() {
  late StorageService storageService;
  late MockBackendApi mockBackendApi;

  setUpAll(() {
    mockBackendApi = MockBackendApi();
    storageService = StorageService(mockBackendApi);
  });

  group('StorageService', () {
    test('uploadImageMultipart returns filename on 201', () async {
      final bytes = [1, 2, 3];
      const filename = 'test.png';
      const folder = 'newsletters';
      final contentType = MediaType('image', 'png');

      when(mockBackendApi.uploadImage(any)).thenAnswer((_) async {
        return HttpResponse(
          {},
          Response(statusCode: 201, requestOptions: RequestOptions(path: '')),
        );
      });

      final result = await storageService.uploadImageMultipart(
        bytes: bytes,
        filename: filename,
        folder: folder,
        contentType: contentType,
      );
      expect(result, filename);
    });

    test('uploadImageMultipart throws on error', () async {
      final bytes = [1, 2, 3];
      const filename = 'test.png';
      const folder = 'newsletters';
      final contentType = MediaType('image', 'png');

      when(mockBackendApi.uploadImage(any)).thenAnswer((_) async {
        return HttpResponse(
          {},
          Response(statusCode: 400, requestOptions: RequestOptions(path: '')),
        );
      });

      expect(
        () async => await storageService.uploadImageMultipart(
          bytes: bytes,
          filename: filename,
          folder: folder,
          contentType: contentType,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
