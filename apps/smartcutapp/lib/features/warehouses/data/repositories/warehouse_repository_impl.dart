import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/warehouse_repository.dart';
import '../data_sources/remote/warehouse_remote_data_source.dart';
import '../models/warehouse_model.dart';

class WarehouseRepositoryImpl implements WarehouseRepository {
  final WarehouseRemoteDataSource remoteDataSource;

  WarehouseRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ApiResponse>> createWarehouse({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createWarehouse(data: data));

  @override
  Future<Either<Failure, PaginatedResult<WarehouseModel>>> getWarehouses({
    required int page,
    required int limit,
  }) async {
    return safeCall(
      () => remoteDataSource.getWarehouses(page: page, limit: limit),
    );
  }

  @override
  Future<Either<Failure, WarehouseModel>> getWarehouseById({
    required String warehouseId,
  }) => safeCall(
    () => remoteDataSource.getWarehouseById(warehouseId: warehouseId),
  );

  @override
  Future<Either<Failure, ApiResponse>> updateWarehouse({
    required String warehouseId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () =>
        remoteDataSource.updateWarehouse(warehouseId: warehouseId, data: data),
  );
}
