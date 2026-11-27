import 'package:board_cut/features/inventories/data/models/inventory_model.dart';
import 'package:board_cut/features/inventories/domain/usecases/get_inventories.dart';
import 'package:board_cut/features/inventories/domain/usecases/get_inventory_analytics.dart';
import 'package:board_cut/features/inventories/domain/usecases/create_inventory_adjustment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InventoriesViewModel extends ChangeNotifier {
  final GetInventories getInventories;
  final GetInventoryAnalytics getInventoryAnalytics;
  final CreateInventoryAdjustment createInventoryAdjustment;

  InventoriesViewModel({
    required this.getInventories,
    required this.getInventoryAnalytics,
    required this.createInventoryAdjustment,
  });

  List<InventoryModel> _inventories = [];
  bool _isLoading = false;
  bool _isUpdating = false;
  String? _error;

  int _totalCount = 0;

  final int _limit = 100;

  var _totalSheets = 0;
  var _totalHardwares = 0;
  var _totalConsumables = 0;

  int get totalSheets => _totalSheets;

  int get totalHardwares => _totalHardwares;

  int get totalConsumables => _totalConsumables;

  List<InventoryModel> get inventories => _inventories;

  bool get isLoading => _isLoading;
  bool get isUpdating => _isUpdating;

  String? get error => _error;

  int get totalCount => _totalCount;

  int rowsPerPage(bool isSmallScreen) => isSmallScreen ? 5 : 8;

  String _sortBy = "name";

  String get sortBy => _sortBy;
  bool _isAscending = true;

  bool get isAscending => _isAscending;

  Future<void> fetchInventories({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final allItems = <InventoryModel>[];
      var currentPage = page;
      var totalPages = page;
      var failed = false;

      while (currentPage <= totalPages) {
        final result = await getInventories(page: currentPage, limit: _limit);
        final response = result.match((failure) {
          _error = failure.message;
          failed = true;
          return null;
        }, (value) => value);
        if (response == null) break;
        allItems.addAll(response.items);
        _totalCount = response.total;
        totalPages = response.totalPages;
        currentPage += 1;
      }

      if (!failed) _inventories = allItems;
    } catch (error) {
      _error = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchInventoryAnalytics() async {
    try {
      final result = await getInventoryAnalytics();
      result.match((failure) => _error = failure.message, (response) {
        _totalSheets = response.materialCount;
        _totalHardwares = response.hardwareCount;
        _totalConsumables = 0;
      });
    } catch (error) {
      _error = error.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> refreshInventory() async {
    await Future.wait([fetchInventories(), fetchInventoryAnalytics()]);
  }

  Future<bool> setOnHand(
    InventoryModel inventory,
    int targetOnHand, {
    String? notes,
  }) async {
    if (_isUpdating) return false;
    if (targetOnHand < inventory.reserved) {
      _error = 'On-hand stock cannot be lower than reserved stock.';
      notifyListeners();
      return false;
    }

    final delta = targetOnHand - inventory.onHand;
    if (delta == 0) return true;

    _isUpdating = true;
    _error = null;
    notifyListeners();
    try {
      final result = await createInventoryAdjustment(
        materialId: inventory.materialId,
        hardwareId: inventory.hardwareId,
        warehouseId: inventory.warehouse.id,
        quantityChange: delta.abs(),
        transactionType: delta > 0 ? 'ADJUSTMENT_IN' : 'ADJUSTMENT_OUT',
        notes: notes,
      );
      final succeeded = result.match((failure) {
        _error = failure.message;
        return false;
      }, (_) => true);
      if (!succeeded) return false;

      await refreshInventory();
      return true;
    } catch (error) {
      _error = error.toString();
      return false;
    } finally {
      _isUpdating = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
  }

  void sort<T>(
    Comparable<T> Function(InventoryModel inventory) getField,
    String column,
  ) {
    if (_sortBy == column) {
      _isAscending = !_isAscending;
    } else {
      _sortBy = column;
      _isAscending = true;
    }

    _inventories.sort((a, b) {
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
