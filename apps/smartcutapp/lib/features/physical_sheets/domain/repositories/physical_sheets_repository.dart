import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';
import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';

import '../../data/models/physical_sheet_model.dart';

abstract class PhysicalSheetsRepository {
  Future<Either<Failure, PaginatedResult<PhysicalSheetModel>>> getSheets({
    required int page,
    required int limit,
    String? search,
  });

  Future<Either<Failure, List<MaterialModel>>> getMaterials();

  Future<Either<Failure, List<WarehouseModel>>> getWarehouses();

  Future<Either<Failure, ApiResponse>> createFull(Map<String, dynamic> data);

  Future<Either<Failure, ApiResponse>> createOffcut(Map<String, dynamic> data);

  Future<Either<Failure, ApiResponse>> action(String id, String action);

  Future<Either<Failure, ApiResponse>> transfer(String id, String warehouseId);
}
