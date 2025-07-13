import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  final String token;
  late final Dio _dio;

  ApiClient({required this.token}) {
    _dio = Dio(
      BaseOptions(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add logging interceptor
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }

  /// GET request
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) {
    return _dio.get(
      url,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
  }

  /// POST request
  Future<Response> post(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  }) {
    return _dio.post(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }

  /// PUT request
  Future<Response> put(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  }) {
    return _dio.put(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }

  /// DELETE request
  Future<Response> delete(
    String url, {
    dynamic body,
    Map<String, dynamic>? headers,
  }) {
    return _dio.delete(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }
}
