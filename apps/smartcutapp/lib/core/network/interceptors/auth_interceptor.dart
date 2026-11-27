import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this.storage);

  static const _accessTokenKey = 'auth_access_token';
  static const _tokenTypeKey = 'auth_token_type';

  final FlutterSecureStorage storage;
  final ValueNotifier<String?> activeCompanyId = ValueNotifier(null);
  VoidCallback? onCompanyInactive;
  String? _accessToken;
  String? _activeCompanyId;
  String _tokenType = 'Bearer';
  bool _companyInactiveLogoutStarted = false;

  Future<void> restoreToken() async {
    _accessToken = await storage.read(key: _accessTokenKey);
    _tokenType = await storage.read(key: _tokenTypeKey) ?? 'Bearer';
    _activeCompanyId = await storage.read(key: 'auth_active_company_id');
    activeCompanyId.value = _activeCompanyId;
    if (_accessToken?.isEmpty ?? true) _accessToken = null;
  }

  Future<void> setAccessToken(
    String accessToken, {
    String tokenType = 'Bearer',
  }) async {
    await storage.write(key: _accessTokenKey, value: accessToken);
    await storage.write(key: _tokenTypeKey, value: tokenType);
    await storage.delete(key: 'auth_active_company_id');
    _accessToken = accessToken;
    _activeCompanyId = null;
    activeCompanyId.value = null;
    _tokenType = tokenType;
    _companyInactiveLogoutStarted = false;
  }

  Future<void> setActiveCompanyId(String? companyId) async {
    if (companyId == null || companyId.isEmpty) {
      await storage.delete(key: 'auth_active_company_id');
    } else {
      await storage.write(key: 'auth_active_company_id', value: companyId);
    }
    _activeCompanyId = companyId;
    activeCompanyId.value = companyId;
  }

  Future<void> clearToken() async {
    _accessToken = null;
    _activeCompanyId = null;
    activeCompanyId.value = null;
    _tokenType = 'Bearer';
    await storage.delete(key: _accessTokenKey);
    await storage.delete(key: _tokenTypeKey);
    await storage.delete(key: 'auth_active_company_id');
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _accessToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = '$_tokenType $token';
    }
    final companyId = _activeCompanyId;
    if (companyId != null && companyId.isNotEmpty) {
      options.headers['X-Company-Id'] = companyId;
    } else {
      options.headers.remove('X-Company-Id');
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final data = err.response?.data;
    final companyIsInactive =
        err.response?.statusCode == 403 &&
        data is Map &&
        data['message'] == 'Company is inactive';

    if (companyIsInactive && !_companyInactiveLogoutStarted) {
      _companyInactiveLogoutStarted = true;
      unawaited(_logoutForInactiveCompany());
    }
    handler.next(err);
  }

  Future<void> _logoutForInactiveCompany() async {
    try {
      await clearToken();
      await Future.wait([
        storage.delete(key: 'auth_user_name'),
        storage.delete(key: 'auth_user_email'),
        storage.delete(key: 'auth_user_role'),
      ]);
    } finally {
      onCompanyInactive?.call();
    }
  }
}
