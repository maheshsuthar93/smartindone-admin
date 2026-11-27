import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/project_model.dart';
import '../../domain/usecases/get_project_analytics.dart';
import '../../domain/usecases/get_projects.dart';

class ProjectsViewModel extends ChangeNotifier {
  final GetProjects getProjects;
  final GetProjectAnalytics getProjectAnalytics;

  ProjectsViewModel({
    required this.getProjects,
    required this.getProjectAnalytics,
  });

  List<ProjectModel> _projects = [];
  bool _isLoading = false;
  String? _error;

  int _totalCount = 0;

  final int _limit = 10;

  var _totalProjects = 0;
  var _totalActiveProjects = 0;
  var _totalCompleteProjects = 0;

  int get totalProjects => _totalProjects;

  int get totalActiveProjects => _totalActiveProjects;

  int get totalCompleteProjects => _totalCompleteProjects;

  List<ProjectModel> get projects => _projects;

  bool get isLoading => _isLoading;

  String? get error => _error;

  int get totalCount => _totalCount;

  int rowsPerPage(bool isSmallScreen) => isSmallScreen ? 5 : 8;

  String _sortBy = "name";

  String get sortBy => _sortBy;
  bool _isAscending = true;

  bool get isAscending => _isAscending;

  Future<void> fetchProjects({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getProjects(page: page, limit: _limit);

    result.match((failure) => _error = failure.message, (response) {
      _projects = response.items;
      _totalCount = response.totalPages;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchProjectAnalytics() async {
    notifyListeners();
    final result = await getProjectAnalytics();

    result.match((failure) => _error = failure.message, (response) {
      _totalProjects = response.total;
      _totalActiveProjects = response.active;
      _totalCompleteProjects = response.completed;
    });

    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
  }

  void sort<T>(
    Comparable<T> Function(ProjectModel project) getField,
    String column,
  ) {
    if (_sortBy == column) {
      _isAscending = !_isAscending;
    } else {
      _sortBy = column;
      _isAscending = true;
    }

    _projects.sort((a, b) {
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
