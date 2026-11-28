import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/warehouse_model.dart';

abstract class WarehouseRepository {
  Future<Either<Failure, ApiResponse>> createWarehouse({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, PaginatedResult<WarehouseModel>>> getWarehouses({
    required int page,
    required int limit,
  });

  Future<Either<Failure, WarehouseModel>> getWarehouseById({
    required String warehouseId,
  });

  Future<Either<Failure, ApiResponse>> updateWarehouse({
    required String warehouseId,
    required Map<String, dynamic> data,
  });
}
