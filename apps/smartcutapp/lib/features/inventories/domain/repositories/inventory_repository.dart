import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/inventories/data/models/inventory_analytics_model.dart';
import 'package:board_cut/features/inventories/data/models/inventory_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class InventoryRepository {
  Future<Either<Failure, PaginatedResult<InventoryModel>>> getInventories({
    required int page,
    required int limit,
  });

  Future<Either<Failure, InventoryAnalyticsModel>> getInventoryAnalytics();

  Future<Either<Failure, bool>> createAdjustment({
    required String? materialId,
    required String? hardwareId,
    required String warehouseId,
    required num quantityChange,
    required String transactionType,
    String? notes,
  });
}
