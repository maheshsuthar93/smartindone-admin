import 'package:flutter/foundation.dart';

import '../../domain/usecases/login.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required this.login});

  final Login login;

  bool _isLoading = false;
  String? _error;
  Map<String, dynamic>? _session;

  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<String, dynamic>? get session => _session;

  Future<bool> signIn({required String email, required String password}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await login(email: email, password: password);
      return await result.match(
        (failure) {
          _error = failure.message;
          return false;
        },
        (session) {
          _session = session;
          return true;
        },
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
