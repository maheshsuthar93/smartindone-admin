import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/warehouse_repository.dart';

class SaveWarehouse {
  const SaveWarehouse(this.repository);

  final WarehouseRepository repository;

  Future<Either<Failure, ApiResponse>> create({
    required Map<String, dynamic> data,
  }) => repository.createWarehouse(data: data);

  Future<Either<Failure, ApiResponse>> update({
    required String warehouseId,
    required Map<String, dynamic> data,
  }) => repository.updateWarehouse(warehouseId: warehouseId, data: data);
}
