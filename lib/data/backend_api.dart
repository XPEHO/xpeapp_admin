import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'backend_api.g.dart';

@RestApi()
abstract class BackendApi {
  factory BackendApi(
    Dio dio, {
    String baseUrl,
  }) = _BackendApi;

  @POST("jwt-auth/v1/token")
  Future<HttpResponse> getToken(
    @Body() Map<String, dynamic> body,
  );

  @POST("jwt-auth/v1/token/validate")
  Future<HttpResponse> validateToken(
    @Header("Authorization") String token,
  );

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

  @POST("xpeho/v1/qvst/campaigns/{id}/status:update")
  Future<HttpResponse> updateQvstCampaignStatus(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );

  @GET("xpeho/v1/agenda/events/")
  Future<HttpResponse> getAllEvents(
    @Query("page") int page,
  );

  @GET("xpeho/v1/agenda/events/{id}")
  Future<HttpResponse> getEventById(
    @Path("id") String id,
  );

  @POST("xpeho/v1/agenda/events")
  Future<HttpResponse> addEvent(
    @Body() Map<String, dynamic> body,
  );

  @PUT("xpeho/v1/agenda/events/{id}")
  Future<HttpResponse> updateEvent(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE("xpeho/v1/agenda/events/{id}")
  Future<HttpResponse> deleteEvent(
    @Path("id") String id,
  );

  // Events-Type
  @GET("xpeho/v1/agenda/events-types/")
  Future<HttpResponse> getAllEventsTypes();

  @GET("xpeho/v1/agenda/events-types/{id}")
  Future<HttpResponse> getEventTypeById(
    @Path("id") String id,
  );

  @POST("xpeho/v1/agenda/events-types/")
  Future<HttpResponse> addEventType(
    @Body() Map<String, dynamic> body,
  );

  @PUT("xpeho/v1/agenda/events-types/{id}")
  Future<HttpResponse> updateEventType(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE("xpeho/v1/agenda/events-types/{id}")
  Future<HttpResponse> deleteEventType(
    @Path("id") String id,
  );

  // Birthday

  @GET("xpeho/v1/agenda/birthday/")
  Future<HttpResponse> getAllBirthdays(
    @Query("page") int page,
  );

  @GET("xpeho/v1/agenda/birthday/{id}")
  Future<HttpResponse> getBirthdayById(
    @Path("id") String id,
  );

  @POST("xpeho/v1/agenda/birthday")
  Future<HttpResponse> addBirthday(
    @Body() Map<String, dynamic> body,
  );

  @PUT("xpeho/v1/agenda/birthday/{id}")
  Future<HttpResponse> updateBirthday(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE("xpeho/v1/agenda/birthday/{id}")
  Future<HttpResponse> deleteBirthday(
    @Path("id") String id,
  );
}
