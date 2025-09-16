import 'package:xpeapp_admin/data/backend_api.dart';
import 'package:dio/dio.dart';

class StorageService {
  final BackendApi _backendApi;

  StorageService(this._backendApi);

  Future<String> uploadImageMultipart({
    required List<int> bytes,
    required String filename,
    required String folder,
  }) async {
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(bytes, filename: filename),
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
