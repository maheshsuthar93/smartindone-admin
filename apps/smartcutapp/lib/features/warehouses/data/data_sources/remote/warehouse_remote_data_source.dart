import 'package:board_cut/core/core.dart';

import '../../models/warehouse_model.dart';

abstract class WarehouseRemoteDataSource {
  Future<ApiResponse> createWarehouse({required Map<String, dynamic> data});

  Future<PaginatedResult<WarehouseModel>> getWarehouses({
    required int page,
    required int limit,
  });

  Future<WarehouseModel> getWarehouseById({required String warehouseId});

  Future<ApiResponse> updateWarehouse({
    required String warehouseId,
    required Map<String, dynamic> data,
  });
}
