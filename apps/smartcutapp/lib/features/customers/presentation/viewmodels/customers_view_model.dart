import 'package:board_cut/features/customers/data/models/customer_model.dart';
import 'package:board_cut/features/customers/domain/usecases/get_customer_analytics.dart';
import 'package:board_cut/features/customers/domain/usecases/get_customers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomersViewModel extends ChangeNotifier {
  CustomersViewModel({
    required this.getCustomers,
    required this.getCustomerAnalytics,
  });

  final GetCustomers getCustomers;
  final GetCustomerAnalytics getCustomerAnalytics;
  List<CustomerModel> _customers = [];
  bool _isLoading = false;
  String? _error;

  int _currentPage = 1;
  int _totalCount = 0;

  final _limit = 10;

  var _totalCustomers = 0;
  var _totalActiveCustomers = 0;
  var _totalInActiveCustomers = 0;

  int get totalCustomers => _totalCustomers;

  int get totalActiveCustomers => _totalActiveCustomers;

  int get totalInActiveCustomers => _totalInActiveCustomers;

  List<CustomerModel> get customers => _customers;

  bool get isLoading => _isLoading;

  String? get error => _error;

  int get totalCount => _totalCount;

  int get currentPage => _currentPage;

  int rowsPerPage(bool isSmallScreen) => isSmallScreen ? 5 : 8;

  String _sortBy = "name";

  String get sortBy => _sortBy;
  bool _isAscending = true;

  bool get isAscending => _isAscending;

  Future<void> fetchCustomers({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    _currentPage = page;

    final result = await getCustomers(page: page, limit: _limit);

    result.match((failure) => _error = failure.message, (response) {
      _customers = response.items;
      _totalCount = response.totalPages;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCustomerAnalytics() async {
    notifyListeners();
    final result = await getCustomerAnalytics();

    result.match((failure) => _error = failure.message, (response) {
      _totalCustomers = response.total;
      _totalActiveCustomers = response.active;
      _totalInActiveCustomers = response.inActive;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await fetchCustomers(page: _currentPage);
    await fetchCustomerAnalytics();
  }

  void clearError() {
    _error = null;
  }

  void sort<T>(
    Comparable<T> Function(CustomerModel customer) getField,
    String column,
  ) {
    if (_sortBy == column) {
      _isAscending = !_isAscending;
    } else {
      _sortBy = column;
      _isAscending = true;
    }

    _customers.sort((a, b) {
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
