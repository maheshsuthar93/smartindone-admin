import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/physical_sheets_repository.dart';
import '../data_sources/remote/physical_sheets_remote_data_source.dart';
import '../models/physical_sheet_model.dart';

import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';

class PhysicalSheetsRepositoryImpl implements PhysicalSheetsRepository {
  PhysicalSheetsRepositoryImpl(this.remote);

  final PhysicalSheetsRemoteDataSource remote;

  @override
  Future<Either<Failure, PaginatedResult<PhysicalSheetModel>>> getSheets({
    required int page,
    required int limit,
    String? search,
  }) => safeCall(
    () => remote.getSheets(page: page, limit: limit, search: search),
  );

  @override
  Future<Either<Failure, List<MaterialModel>>> getMaterials() =>
      safeCall(remote.getMaterials);

  @override
  Future<Either<Failure, List<WarehouseModel>>> getWarehouses() =>
      safeCall(remote.getWarehouses);

  @override
  Future<Either<Failure, ApiResponse>> createFull(Map<String, dynamic> data) =>
      safeCall(() => remote.createFull(data));

  @override
  Future<Either<Failure, ApiResponse>> createOffcut(
    Map<String, dynamic> data,
  ) => safeCall(() => remote.createOffcut(data));

  @override
  Future<Either<Failure, ApiResponse>> action(String id, String action) =>
      safeCall(() => remote.action(id, action));

  @override
  Future<Either<Failure, ApiResponse>> transfer(
    String id,
    String warehouseId,
  ) => safeCall(() => remote.transfer(id, warehouseId));
}
