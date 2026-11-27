import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/hardwares/data/models/hardware_model.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';
import 'package:board_cut/features/warehouses/domain/usecases/get_warehouses.dart';
import 'package:flutter/foundation.dart';

import '../../domain/usecases/create_hardware.dart';
import '../../domain/usecases/deactivate_hardware.dart';
import '../../domain/usecases/get_hardwares.dart';
import '../../domain/usecases/update_hardware.dart';

class HardwaresViewModel extends ChangeNotifier {
  HardwaresViewModel({
    required this.getHardwares,
    required this.createHardware,
    required this.updateHardware,
    required this.deactivateHardware,
    required this.getWarehouses,
  });

  final GetHardwares getHardwares;
  final CreateHardware createHardware;
  final UpdateHardware updateHardware;
  final DeactivateHardware deactivateHardware;
  final GetWarehouses getWarehouses;

  static const int _limit = 100;
  int _pageSize = 10;
  int _currentPage = 1;
  int _totalCount = 0;
  int _totalPages = 0;
  String _search = '';
  bool _isLoading = false;
  bool _isLoadingWarehouses = false;
  bool _isSaving = false;
  String? _error;
  String? _warehouseError;
  List<HardwareModel> _hardwares = [];
  List<WarehouseModel> _warehouses = [];

  List<HardwareModel> get hardwares => _hardwares;
  List<WarehouseModel> get warehouses => _warehouses;
  bool get isLoading => _isLoading;
  bool get isLoadingWarehouses => _isLoadingWarehouses;
  bool get isSaving => _isSaving;
  String? get error => _error;
  String? get warehouseError => _warehouseError;
  int get currentPage => _currentPage;
  int get pageSize => _pageSize;
  int get totalCount => _totalCount;
  int get totalPages => _totalPages;
  String get search => _search;

  void setPageSize(int value) {
    if (value > 0) _pageSize = value;
  }

  Future<void> fetchHardwares({int page = 1, String? search}) async {
    _isLoading = true;
    _error = null;
    _currentPage = page;
    if (search != null) _search = search;
    notifyListeners();

    final result = await getHardwares(
      page: page,
      limit: _pageSize,
      search: _search.isEmpty ? null : _search,
    );
    result.match((failure) => _error = failure.message, (response) {
      _hardwares = response.items;
      _currentPage = response.page;
      _totalCount = response.total;
      _totalPages = response.totalPages;
    });
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchWarehouses() async {
    _isLoadingWarehouses = true;
    _warehouseError = null;
    notifyListeners();
    final result = await getWarehouses(page: 1, limit: _limit);
    result.match((failure) => _warehouseError = failure.message, (response) {
      _warehouses = response.items
          .where((warehouse) => warehouse.status == WarehouseStatus.active)
          .toList();
    });
    _isLoadingWarehouses = false;
    notifyListeners();
  }

  Future<String?> saveHardware({
    String? hardwareId,
    required Map<String, dynamic> data,
  }) async {
    _isSaving = true;
    _error = null;
    notifyListeners();
    final result = hardwareId == null
        ? await createHardware(data: data)
        : await updateHardware(hardwareId: hardwareId, data: data);
    var succeeded = false;
    result.match((failure) => _error = failure.message, (response) {
      if (response.success) {
        succeeded = true;
      } else {
        _error = response.message;
      }
    });
    final message = _error;
    _isSaving = false;
    notifyListeners();
    if (succeeded) {
      await fetchHardwares(page: hardwareId == null ? 1 : _currentPage);
    }
    return succeeded ? null : (message ?? 'Could not save hardware.');
  }

  Future<String?> deactivate(String hardwareId) async {
    _isSaving = true;
    _error = null;
    notifyListeners();
    final result = await deactivateHardware(hardwareId: hardwareId);
    var succeeded = false;
    result.match((failure) => _error = failure.message, (response) {
      if (response.success) {
        succeeded = true;
      } else {
        _error = response.message;
      }
    });
    final message = _error;
    _isSaving = false;
    if (succeeded) {
      final page = _currentPage > 1 && _hardwares.length == 1
          ? _currentPage - 1
          : _currentPage;
      await fetchHardwares(page: page);
    } else {
      notifyListeners();
    }
    return succeeded ? null : (message ?? 'Could not deactivate hardware.');
  }
}
