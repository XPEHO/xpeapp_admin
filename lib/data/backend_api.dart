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

  @GET("xpeho/v1/qvst/themes")
  Future<HttpResponse> getAllQvstThemes();

  @GET("xpeho/v1/qvst/themes/{id}/questions")
  Future<HttpResponse> getAllQvstQuestionsByThemeId(
    @Path("id") String id,
  );

  @POST("xpeho/v1/qvst:add")
  Future<HttpResponse> addQvst(
    @Body() Map<String, dynamic> body,
  );

  @DELETE("xpeho/v1/qvst/{id}:delete")
  Future<HttpResponse> deleteQvst(
    @Path("id") String id,
  );

  @GET("xpeho/v1/qvst/answers_repo")
  Future<HttpResponse> getQvstAnswersRepo();

  @POST("xpeho/v1/qvst/answers_repo/{id}:update")
  Future<HttpResponse> updateQvstAnswersRepo(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );

  @GET("xpeho/v1/qvst/campaigns")
  Future<HttpResponse> getAllQvstCampaigns();

  @POST("xpeho/v1/qvst/campaigns:add")
  Future<HttpResponse> addQvstCampaign(
    @Body() Map<String, dynamic> body,
  );

  @POST("xpeho/v1/qvst/{id}:update")
  Future<HttpResponse> updateQvst(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );

  @POST("xpeho/v1/qvst:import")
  Future<HttpResponse> importQvstFile(
    @Body() Map<String, dynamic> body,
  );

  @GET("xpeho/v1/qvst/campaigns/{id}:stats")
  Future<HttpResponse> getQvstCampaignStatsById(
    @Path("id") String id,
  );
}
