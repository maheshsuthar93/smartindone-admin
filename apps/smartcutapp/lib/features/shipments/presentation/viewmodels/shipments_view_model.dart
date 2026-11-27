import 'package:board_cut/core/enums/enums.dart';
import 'package:board_cut/features/shipments/data/models/model.dart';
import 'package:board_cut/features/shipments/domain/usecases/get_shipments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShipmentsViewModel extends ChangeNotifier {
  final GetShipments getShipments;

  ShipmentsViewModel({required this.getShipments});

  List<ShipmentModel> _shipments = [];
  bool _isLoading = false;
  String? _error;
  ShipmentStatus? selectedStatus;
  int _totalCount = 0;

  final int _limit = 10;

  List<ShipmentModel> get shipments => _shipments;

  bool get isLoading => _isLoading;

  String? get error => _error;

  int get totalCount => _totalCount;

  int rowsPerPage(bool isSmallScreen) => isSmallScreen ? 5 : 10;
  String _sortBy = "name";

  String get sortBy => _sortBy;
  bool _isAscending = true;

  bool get isAscending => _isAscending;

  Future<void> fetchShipments({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getShipments(page: page, limit: _limit);

    result.match((failure) => _error = failure.message, (response) {
      _shipments = response.items;
      _totalCount = response.totalPages;
    });

    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
  }

  void sort<T>(
    Comparable<T> Function(ShipmentModel shipment) getField,
    String column,
  ) {
    if (_sortBy == column) {
      _isAscending = !_isAscending;
    } else {
      _sortBy = column;
      _isAscending = true;
    }

    _shipments.sort((a, b) {
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
