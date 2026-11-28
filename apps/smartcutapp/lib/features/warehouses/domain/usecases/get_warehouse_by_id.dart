import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/warehouse_model.dart';
import '../repositories/warehouse_repository.dart';

class GetWarehouseById {
  GetWarehouseById(this.repository);

  final WarehouseRepository repository;

  Future<Either<Failure, WarehouseModel>> call({required String warehouseId}) =>
      repository.getWarehouseById(warehouseId: warehouseId);
}
