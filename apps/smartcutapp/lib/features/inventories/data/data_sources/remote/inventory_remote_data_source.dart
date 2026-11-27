import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/inventories/data/models/inventory_analytics_model.dart';

import '../../models/inventory_model.dart';

abstract class InventoryRemoteDataSource {
  Future<PaginatedResult<InventoryModel>> getInventories({
    required int page,
    required int limit,
  });

  Future<InventoryAnalyticsModel> getInventoryAnalytics();

  Future<bool> createAdjustment({
    required String? materialId,
    required String? hardwareId,
    required String warehouseId,
    required num quantityChange,
    required String transactionType,
    String? notes,
  });
}
