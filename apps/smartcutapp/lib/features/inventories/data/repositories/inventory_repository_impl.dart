import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/inventories/data/models/inventory_analytics_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/inventory_repository.dart';
import '../data_sources/remote/inventory_remote_data_source.dart';
import '../models/inventory_model.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryRemoteDataSource remoteDataSource;

  InventoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResult<InventoryModel>>> getInventories({
    required int page,
    required int limit,
  }) async {
    return safeCall(
      () => remoteDataSource.getInventories(page: page, limit: limit),
    );
  }

  @override
  Future<Either<Failure, InventoryAnalyticsModel>> getInventoryAnalytics() {
    return safeCall(() => remoteDataSource.getInventoryAnalytics());
  }

  @override
  Future<Either<Failure, bool>> createAdjustment({
    required String? materialId,
    required String? hardwareId,
    required String warehouseId,
    required num quantityChange,
    required String transactionType,
    String? notes,
  }) => safeCall(
    () => remoteDataSource.createAdjustment(
      materialId: materialId,
      hardwareId: hardwareId,
      warehouseId: warehouseId,
      quantityChange: quantityChange,
      transactionType: transactionType,
      notes: notes,
    ),
  );
}
