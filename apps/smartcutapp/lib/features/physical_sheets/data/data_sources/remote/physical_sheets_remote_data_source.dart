import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';

import '../../models/physical_sheet_model.dart';

abstract class PhysicalSheetsRemoteDataSource {
  Future<PaginatedResult<PhysicalSheetModel>> getSheets({
    required int page,
    required int limit,
    String? search,
  });

  Future<List<MaterialModel>> getMaterials();

  Future<List<WarehouseModel>> getWarehouses();

  Future<ApiResponse> createFull(Map<String, dynamic> data);

  Future<ApiResponse> createOffcut(Map<String, dynamic> data);

  Future<ApiResponse> action(String id, String action);

  Future<ApiResponse> transfer(String id, String warehouseId);
}
