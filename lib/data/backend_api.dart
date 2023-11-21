import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'backend_api.g.dart';

@RestApi()
abstract class BackendApi {
  factory BackendApi(
    Dio dio, {
    String baseUrl,
  }) = _BackendApi;

  @POST("xpeho/v1/notifications")
  Future<HttpResponse> sendNotification(
    @Body() Map<String, dynamic> body,
  );
}
