import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/order_model.dart';
import '../../domain/usecases/get_order_analytics.dart';
import '../../domain/usecases/get_orders.dart';
import '../../domain/usecases/update_order.dart';

class OrdersViewModel extends ChangeNotifier {
  final GetOrders getOrders;
  final GetOrderAnalytics getOrderAnalytics;
  final UpdateOrder updateOrder;

  OrdersViewModel({
    required this.getOrders,
    required this.getOrderAnalytics,
    required this.updateOrder,
  });

  List<OrderModel> _orders = [];
  bool _isLoading = false;
  String? _error;
  String? _updatingOrderId;

  var _currentPage = 1;
  final _rowsPerPage = 5;
  var _totalCount = 0;

  final _limit = 10;

  var _totalOrders = 0;
  var _totalActiveOrder = 0;
  var _totalCompleteOrder = 0;

  int get totalOrders => _totalOrders;

  int get totalActiveOrder => _totalActiveOrder;

  int get totalCompleteOrder => _totalCompleteOrder;

  List<OrderModel> get orders => _orders;

  bool get isLoading => _isLoading;

  String? get error => _error;

  String? get updatingOrderId => _updatingOrderId;

  int get totalCount => _totalCount;

  int get rowsPerPage => _rowsPerPage;
  String _sortBy = "name";

  String get sortBy => _sortBy;
  bool _isAscending = true;

  bool get isAscending => _isAscending;

  Future<void> fetchOrders({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    _currentPage = page;

    final result = await getOrders(page: page, limit: _limit);

    result.match((failure) => _error = failure.message, (response) {
      _orders = response.items;
      _totalCount = response.totalPages;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchOrderAnalytics() async {
    notifyListeners();
    final result = await getOrderAnalytics();

    result.match((failure) => _error = failure.message, (response) {
      _totalOrders = response.total;
      _totalActiveOrder = response.active;
      _totalCompleteOrder = response.completed;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<String?> updateOrderStatus({
    required String orderId,
    required String status,
  }) async {
    _updatingOrderId = orderId;
    notifyListeners();

    final result = await updateOrder(
      orderId: orderId,
      data: {'status': status},
    );

    final message = result.match(
      (failure) => failure.message,
      (response) => response.success ? null : response.message,
    );

    if (message == null) {
      await Future.wait([
        fetchOrders(page: _currentPage),
        fetchOrderAnalytics(),
      ]);
    }

    _updatingOrderId = null;
    notifyListeners();
    return message;
  }

  void clearError() {
    _error = null;
  }

  void sort<T>(
    Comparable<T> Function(OrderModel order) getField,
    String column,
  ) {
    if (_sortBy == column) {
      _isAscending = !_isAscending;
    } else {
      _sortBy = column;
      _isAscending = true;
    }

    _orders.sort((a, b) {
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
