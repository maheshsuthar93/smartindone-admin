import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/get_warehouses.dart';

class WarehousesViewModel extends ChangeNotifier {
  final GetWarehouses getWarehouses;

  WarehousesViewModel({required this.getWarehouses});

  List<WarehouseModel> _warehouses = [];
  bool _isLoading = false;
  String? _error;

  int _totalCount = 0;

  final int _limit = 10;

  List<WarehouseModel> get warehouses => _warehouses;

  bool get isLoading => _isLoading;

  String? get error => _error;

  int get totalCount => _totalCount;

  int rowsPerPage(bool isSmallScreen) => isSmallScreen ? 7 : 10;
  String _sortBy = "name";

  String get sortBy => _sortBy;
  bool _isAscending = true;

  bool get isAscending => _isAscending;

  Future<void> fetchWarehouses({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getWarehouses(page: page, limit: _limit);

    result.match((failure) => _error = failure.message, (response) {
      _warehouses = response.items;
      _totalCount = response.totalPages;
    });

    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
  }

  void sort<T>(
    Comparable<T> Function(WarehouseModel user) getField,
    String column,
  ) {
    if (_sortBy == column) {
      _isAscending = !_isAscending;
    } else {
      _sortBy = column;
      _isAscending = true;
    }

    _warehouses.sort((a, b) {
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
