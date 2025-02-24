import 'package:http/http.dart' as http;

class BackendApiBase {
  final http.Client httpClient = http.Client();
  final String baseUrl;

  BackendApiBase({required this.baseUrl});

  Future<http.Response> fetchQvstStatsCsv(
    String campaignId,
    String token,
  ) async {
    final url =
        '${baseUrl}xpeho/v1/qvst/campaigns/csv/?campaign_id=$campaignId';
    return await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }
}
