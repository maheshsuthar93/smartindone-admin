import 'package:flutter/foundation.dart';

import '../../data/models/package_detail_model.dart';
import '../../data/models/available_package_piece_model.dart';
import '../../data/models/available_package_hardware_model.dart';
import '../../../warehouses/data/models/warehouse_model.dart';
import '../../domain/usecases/create_package.dart';
import '../../domain/usecases/get_available_package_pieces.dart';
import '../../domain/usecases/get_available_package_hardware.dart';
import '../../domain/usecases/get_package.dart';
import '../../domain/usecases/update_package.dart';
import '../../../warehouses/domain/usecases/get_warehouses.dart';

class PackageViewModel extends ChangeNotifier {
  PackageViewModel({
    required this.getPackage,
    required this.getAvailablePackagePieces,
    required this.getAvailablePackageHardware,
    required this.getWarehouses,
    required this.createPackage,
    required this.updatePackage,
  });

  final GetPackage getPackage;
  final GetAvailablePackagePieces getAvailablePackagePieces;
  final GetAvailablePackageHardware getAvailablePackageHardware;
  final GetWarehouses getWarehouses;
  final CreatePackage createPackage;
  final UpdatePackage updatePackage;

  PackageDetailModel? package;
  bool isLoading = false;
  bool isSaving = false;
  bool isPiecesLoading = false;
  bool isHardwareLoading = false;
  bool isWarehousesLoading = false;
  List<AvailablePackagePieceModel> pieces = [];
  List<AvailablePackageHardwareModel> hardware = [];
  List<WarehouseModel> warehouses = [];
  String? orderId;

  String? error;

  void clearError() {
    error = null;
  }

  Future<void> fetchPackage(String id) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      final result = await getPackage(packageId: id);
      result.match(
        (failure) => error = failure.message,
        (value) => package = value,
      );
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAvailablePieces(String orderId) async {
    isPiecesLoading = true;
    error = null;
    notifyListeners();
    try {
      final result = await getAvailablePackagePieces(orderId: orderId);
      result.match(
        (failure) => error = failure.message,
        (value) => pieces = value,
      );
    } catch (e) {
      error = e.toString();
    } finally {
      isPiecesLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWarehouses() async {
    isWarehousesLoading = true;
    notifyListeners();
    try {
      final result = await getWarehouses(page: 1, limit: 100);
      result.match(
        (failure) => error = failure.message,
        (response) => warehouses = response.items,
      );
    } catch (e) {
      error = e.toString();
    } finally {
      isWarehousesLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAvailableHardware(String warehouseId) async {
    isHardwareLoading = true;
    error = null;
    notifyListeners();
    try {
      final result = await getAvailablePackageHardware(
        warehouseId: warehouseId,
      );
      result.match(
        (failure) => error = failure.message,
        (value) => hardware = value,
      );
    } catch (e) {
      error = e.toString();
    } finally {
      isHardwareLoading = false;
      notifyListeners();
    }
  }

  Future<bool> save({
    String? packageId,
    required Map<String, dynamic> data,
  }) async {
    isSaving = true;
    error = null;
    notifyListeners();
    try {
      final result = packageId == null
          ? await createPackage(data: data)
          : await updatePackage(packageId: packageId, data: data);
      return await result.match(
        (failure) {
          error = failure.message;
          return false;
        },
        (success) {
          if (!success) error = 'Could not save package';
          return success;
        },
      );
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }
}
