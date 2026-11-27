import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/physical_sheets_repository.dart';
import '../../data/models/physical_sheet_model.dart';

import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';

class PhysicalSheetUseCases {
  PhysicalSheetUseCases(this.repo);

  final PhysicalSheetsRepository repo;

  Future<Either<Failure, PaginatedResult<PhysicalSheetModel>>> getSheets({
    required int page,
    required int limit,
    String? search,
  }) => repo.getSheets(page: page, limit: limit, search: search);

  Future<Either<Failure, List<MaterialModel>>> getMaterials() =>
      repo.getMaterials();

  Future<Either<Failure, List<WarehouseModel>>> getWarehouses() =>
      repo.getWarehouses();

  Future<Either<Failure, ApiResponse>> createFull(Map<String, dynamic> data) =>
      repo.createFull(data);

  Future<Either<Failure, ApiResponse>> createOffcut(
    Map<String, dynamic> data,
  ) => repo.createOffcut(data);

  Future<Either<Failure, ApiResponse>> action(String id, String action) =>
      repo.action(id, action);

  Future<Either<Failure, ApiResponse>> transfer(
    String id,
    String warehouseId,
  ) => repo.transfer(id, warehouseId);
}
