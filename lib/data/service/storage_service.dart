import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class StorageService {
  final BackendApi _backendApi;

  StorageService(this._backendApi);

// Upload image as multipart/form-data
  Future<String> uploadImageMultipart({
    required List<int> bytes,
    required String filename,
    required String folder,
    MediaType? contentType,
  }) async {
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        bytes,
        filename: filename,
        // Specify the content type if provided (e.g., image/png)
        contentType: contentType,
      ),
      'folder': folder,
    });

    final response = await _backendApi.uploadImageMultipart(formData);
    if (response.response.statusCode == 200) {
      return filename;
    } else {
      throw Exception('Erreur lors de l\'ajout de l\'image');
    }
  }
}
