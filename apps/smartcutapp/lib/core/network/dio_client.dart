import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/api_feedback_interceptor.dart';
import 'interceptors/mock_interceptor.dart';

class DioClient {
  final Dio dio;
  final AuthInterceptor authInterceptor;

  static String get _baseUrl {
    const configuredBaseUrl = String.fromEnvironment('API_BASE_URL');
    if (configuredBaseUrl.isNotEmpty) return configuredBaseUrl;

    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:3000';
    }
    return 'http://localhost:3000';
  }

  DioClient(this.authInterceptor)
    : dio = Dio(
        BaseOptions(
          baseUrl: _baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {"Content-Type": "application/json"},
        ),
      ) {
    dio.interceptors.add(authInterceptor);
    dio.interceptors.add(ApiFeedbackInterceptor());
    if (isMock) {
      dio.interceptors.add(MockInterceptor());
    }
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  bool isMock = false;
}
