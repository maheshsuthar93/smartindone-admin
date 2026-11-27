import 'dart:io';

import 'package:dio/dio.dart';

import 'failure.dart';

abstract final class DioFailureMapper {
  const DioFailureMapper._();

  static Failure fromError(Object error) {
    if (error is SocketException) {
      return const Failure.network(message: 'No internet connection');
    }

    if (error is! DioException) {
      final message = error.toString();
      final cleanMessage = message.startsWith('Exception:')
          ? message.substring('Exception:'.length).trim()
          : message.startsWith('Error:')
          ? message.substring('Error:'.length).trim()
          : message;
      return Failure.unknown(message: cleanMessage);
    }

    final response = error.response;
    final data = response?.data;
    final statusCode = response?.statusCode;

    final message =
        _extractMessage(data) ?? error.message ?? 'Something went wrong';

    switch (error.type) {
      case DioExceptionType.connectionError:
        return const Failure.network(message: 'No internet connection');

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const Failure.timeout(message: 'Connection timeout');

      case DioExceptionType.cancel:
        return Failure.cancelled(message: message);

      case DioExceptionType.badCertificate:
        return const Failure.certificate(
          message: 'SSL certificate validation failed',
        );

      case DioExceptionType.badResponse:
        return _mapStatusCode(
          statusCode: statusCode,
          data: data,
          message: message,
        );

      case DioExceptionType.unknown:
        return Failure.unknown(
          message: message,
          statusCode: statusCode,
          data: data,
        );
    }
  }

  static Failure _mapStatusCode({
    required int? statusCode,
    required dynamic data,
    required String message,
  }) {
    switch (statusCode) {
      case 400:
      case 422:
        return Failure.validation(
          message: message,
          statusCode: statusCode,
          data: data,
          errors: _extractErrors(data),
        );

      case 401:
        return Failure.unauthorized(
          message: message,
          statusCode: statusCode,
          data: data,
        );

      case 403:
        return Failure.forbidden(
          message: message,
          statusCode: statusCode,
          data: data,
        );

      case 404:
        return Failure.notFound(
          message: message,
          statusCode: statusCode,
          data: data,
        );

      case 409:
        return Failure.conflict(
          message: message,
          statusCode: statusCode,
          data: data,
        );

      case 429:
        return Failure.rateLimit(
          message: message,
          statusCode: statusCode,
          data: data,
        );

      case 500:
      case 502:
      case 503:
      case 504:
        return Failure.server(
          message: message,
          statusCode: statusCode,
          data: data,
        );

      default:
        return Failure.unknown(
          message: message,
          statusCode: statusCode,
          data: data,
        );
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message']?.toString() ??
          data['error']?.toString() ??
          data['detail']?.toString() ??
          data['title']?.toString() ??
          data['description']?.toString();
    }

    if (data is String && data.trim().isNotEmpty) {
      return data;
    }

    return null;
  }

  static Map<String, dynamic>? _extractErrors(dynamic data) {
    if (data is Map<String, dynamic>) {
      final errors = data['errors'];

      if (errors is Map<String, dynamic>) {
        return errors;
      }
    }

    return null;
  }
}
