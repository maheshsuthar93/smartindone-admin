import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/inventory_repository.dart';

class CreateInventoryAdjustment {
  const CreateInventoryAdjustment(this.repository);

  final InventoryRepository repository;

  Future<Either<Failure, bool>> call({
    required String? materialId,
    required String? hardwareId,
    required String warehouseId,
    required num quantityChange,
    required String transactionType,
    String? notes,
  }) => repository.createAdjustment(
    materialId: materialId,
    hardwareId: hardwareId,
    warehouseId: warehouseId,
    quantityChange: quantityChange,
    transactionType: transactionType,
    notes: notes,
  );
}
