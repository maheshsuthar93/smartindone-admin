import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/inventories/data/models/inventory_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/inventory_repository.dart';

class GetInventories {
  final InventoryRepository repository;

  GetInventories(this.repository);

  Future<Either<Failure, PaginatedResult<InventoryModel>>> call({
    required int page,
    required int limit,
  }) async {
    return repository.getInventories(page: page, limit: limit);
  }
}
