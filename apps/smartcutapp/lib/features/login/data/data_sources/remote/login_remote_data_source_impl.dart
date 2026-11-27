import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/network/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl(
    this.apiClient,
    this.authInterceptor,
    this.secureStorage,
  );

  final ApiClient apiClient;
  final AuthInterceptor authInterceptor;
  final FlutterSecureStorage secureStorage;

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiClient.post(
        '/api/auth/login',
        data: {'email': email, 'password': password},
      );
      final result = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data,
        (data) => Map<String, dynamic>.from(data as Map),
      );
      if (!result.success || result.data == null) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: result.message,
          type: DioExceptionType.badResponse,
        );
      }
      final session = result.data!;
      final token = session['accessToken'] as String;
      final tokenType = session['tokenType'] as String;
      await authInterceptor.setAccessToken(token, tokenType: tokenType);
      final user = Map<String, dynamic>.from(session['user'] as Map);
      await secureStorage.write(
        key: 'auth_user_name',
        value: user['name'] as String?,
      );
      await secureStorage.write(
        key: 'auth_user_email',
        value: user['email'] as String?,
      );
      await secureStorage.write(
        key: 'auth_user_role',
        value: user['role'] as String?,
      );
      return session;
    } on DioException {
      rethrow;
    }
  }
}
