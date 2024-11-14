import 'package:dio/dio.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';

class TokenInterceptor extends Interceptor {
  XpehoUser? userConnected;

  TokenInterceptor(this.userConnected);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = userConnected?.token?.token ?? '';
    options.headers['Authorization'] = 'Bearer $token';

    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    super.onError(err, handler);
  }
}
