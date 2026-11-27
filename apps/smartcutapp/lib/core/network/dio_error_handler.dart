import 'package:dio/dio.dart';

import '../error/exceptions.dart';

class DioErrorHandler {
  static Exception handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkException();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;

        if (statusCode == 401) {
          return UnauthorizedException();
        }

        return ServerException(
          error.response?.data['message'] ?? 'Server error',
        );

      default:
        return ServerException('Unexpected error');
    }
  }
}
