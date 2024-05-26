import 'package:dio/dio.dart';
import 'package:flutter_learn/core/constats/errors/exception.dart';

class DioHelper {
  final Dio dio;

  DioHelper(this.dio);

  Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: query,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException("Something went wrong");
    }
  }

  Future<Response> post({
    required String url,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException("Something went wrong");
    }
  }

  Future<Response> put({
    required String url,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.put(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException("Something went wrong");
    }
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.delete(
        url,
        queryParameters: query,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException("Something went wrong");
    }
  }
}

Exception handleDioException(DioException e) {
  if (e.type == DioExceptionType.cancel) {
    return CancelRequestException();

    /// Custom exception for canceled requests
  } else if (e.response?.statusCode == 401) {
    return UnauthorizedException();

    /// Custom exception for unauthorized access
  } else {
    /// Handle other Dio errors based on status codes or types
    return ServerException(e.message ?? "Network error");
  }
}
