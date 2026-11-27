import 'package:board_cut/core/enums/enums.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/get_users.dart';

class UsersViewModel extends ChangeNotifier {
  final GetUsers getUsers;

  UsersViewModel({required this.getUsers});

  List<UserModel> _users = [];
  bool _isLoading = false;
  String? _error;

  int _currentPage = 1;
  int _totalCount = 0;
  int _totalPages = 0;

  final int _limit = 10;

  List<UserModel> get users => _users;

  bool get isLoading => _isLoading;

  String? get error => _error;

  int get totalCount => _totalCount;
  int get totalUsers => _totalCount;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;

  int rowsPerPage(bool isSmallScreen) => isSmallScreen ? 5 : 8;
  String _sortBy = "name";

  String get sortBy => _sortBy;
  bool _isAscending = true;

  bool get isAscending => _isAscending;

  Future<void> fetchUsers({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    _currentPage = page;

    final result = await getUsers(page: page, limit: _limit);

    result.match((failure) => _error = failure.message, (response) {
      _users = response.items;
      _currentPage = response.page;
      _totalCount = response.total;
      _totalPages = response.totalPages;
    });

    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
  }

  void sort<T>(Comparable<T> Function(UserModel user) getField, String column) {
    if (_sortBy == column) {
      _isAscending = !_isAscending;
    } else {
      _sortBy = column;
      _isAscending = true;
    }

    _users.sort((a, b) {
      final aIsSuperAdmin = a.role == UserRole.superAdmin;
      final bIsSuperAdmin = b.role == UserRole.superAdmin;
      if (aIsSuperAdmin != bIsSuperAdmin) {
        return aIsSuperAdmin ? -1 : 1;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      if (_isAscending) {
        return Comparable.compare(aValue, bValue);
      } else {
        return Comparable.compare(bValue, aValue);
      }
    });

    notifyListeners();
  }
}
