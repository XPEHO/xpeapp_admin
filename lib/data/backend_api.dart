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

  @GET("xpeho/v1/qvst")
  Future<HttpResponse> getAllQvst();

  @GET("xpeho/v1/qvst/{id}")
  Future<HttpResponse> getQvstById(
    @Path("id") String id,
  );

  @GET("xpeho/v1/qvst/{id}:resume")
  Future<HttpResponse> getQvstResumeById(
    @Path("id") String id,
  );

  @GET("xpeho/v1/qvst/themes")
  Future<HttpResponse> getAllQvstThemes();

  @POST("xpeho/v1/qvst:add")
  Future<HttpResponse> addQvst(
    @Body() Map<String, dynamic> body,
  );

  @DELETE("xpeho/v1/qvst/{id}:delete")
  Future<HttpResponse> deleteQvst(
    @Path("id") String id,
  );
}
