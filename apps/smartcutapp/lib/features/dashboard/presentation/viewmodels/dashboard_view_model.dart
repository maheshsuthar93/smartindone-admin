import 'package:board_cut/features/dashboard/domain/usecases/get_dashboard_orders.dart';
import 'package:flutter/material.dart';

import '../../data/models/dashboard_analytics_model.dart';
import '../../data/models/dashboard_order_model.dart';
import '../../domain/usecases/get_dashboard_analytics.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel({
    required this.getDashboardAnalytics,
    required this.getDashboardOrders,
  });

  final GetDashboardAnalytics getDashboardAnalytics;
  final GetDashboardOrders getDashboardOrders;
  bool _isLoading = false;
  String? _error;
  DashboardAnalyticsModel? _analytics;
  List<DashboardOrderModel> _orders = [];

  List<DashboardOrderModel> get orders => _orders;
  bool get isLoading => _isLoading;
  String? get error => _error;
  DashboardAnalyticsModel? get analytics => _analytics;
  bool get isAnalyticsLoading => _isAnalyticsLoading;

  bool _isAnalyticsLoading = true;

  final _limit = 10;

  int rowsPerPage(bool isSmallScreen) => isSmallScreen ? 5 : 10;

  Future<void> fetchDashboardAnalytics() async {
    _isAnalyticsLoading = true;
    notifyListeners();
    final result = await getDashboardAnalytics();

    result.match((failure) => _error = failure.message, (response) {
      _analytics = response;
    });

    _isAnalyticsLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await Future.wait([fetchDashboardAnalytics(), fetchOrders()]);
  }

  Future<void> fetchOrders({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getDashboardOrders(page: page, limit: _limit);

    result.match((failure) => _error = failure.message, (response) {
      _orders = response.items;
    });

    _isLoading = false;
    notifyListeners();
  }
}
