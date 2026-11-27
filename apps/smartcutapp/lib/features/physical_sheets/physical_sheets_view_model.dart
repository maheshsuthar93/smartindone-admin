import 'package:flutter/foundation.dart';

import 'domain/usecases/physical_sheet_usecases.dart';
import 'data/models/physical_sheet_model.dart';

import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';

class PhysicalSheetsViewModel extends ChangeNotifier {
  PhysicalSheetsViewModel(this.useCases);

  final PhysicalSheetUseCases useCases;
  List<PhysicalSheetModel> sheets = [];
  List<MaterialModel> materials = [];
  List<WarehouseModel> warehouses = [];
  int page = 1, limit = 10, total = 0, totalPages = 0;
  String search = '';
  bool isLoading = false, isSaving = false;
  String? error;

  Future<void> load({int page = 1, String? search}) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      this.page = page;
      if (search != null) this.search = search;
      final result = await useCases.getSheets(
        page: this.page,
        limit: limit,
        search: this.search.isEmpty ? null : this.search,
      );
      result.match((failure) => error = failure.message, (data) {
        sheets = data.items;
        this.page = data.page;
        total = data.total;
        totalPages = data.totalPages;
      });
      if (materials.isEmpty) {
        final materialResult = await useCases.getMaterials();
        materialResult.match(
          (failure) => error ??= failure.message,
          (data) => materials = data,
        );
      }
      if (warehouses.isEmpty) {
        final warehouseResult = await useCases.getWarehouses();
        warehouseResult.match(
          (failure) => error ??= failure.message,
          (data) => warehouses = data,
        );
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> createFull(Map<String, dynamic> data) =>
      _mutate(() => useCases.createFull(data));

  Future<String?> createOffcut(Map<String, dynamic> data) =>
      _mutate(() => useCases.createOffcut(data));

  Future<String?> action(String id, String action) =>
      _mutate(() => useCases.action(id, action));

  Future<String?> transfer(String id, String warehouseId) =>
      _mutate(() => useCases.transfer(id, warehouseId));

  Future<String?> _mutate(Future<dynamic> Function() call) async {
    isSaving = true;
    notifyListeners();
    try {
      final result = await call();
      String? failureMessage;
      var succeeded = false;
      result.match((failure) => failureMessage = failure.message, (response) {
        succeeded = response.success;
        if (!response.success) failureMessage = response.message;
      });
      if (!succeeded) return failureMessage ?? 'Sheet operation failed.';
      await load(page: page, search: search);
      return null;
    } catch (e) {
      return e.toString();
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }
}
