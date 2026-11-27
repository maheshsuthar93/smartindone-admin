import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/warehouse_model.dart';
import '../repositories/warehouse_repository.dart';

class GetWarehouses {
  final WarehouseRepository repository;

  GetWarehouses(this.repository);

  Future<Either<Failure, PaginatedResult<WarehouseModel>>> call({
    required int page,
    required int limit,
  }) async {
    return repository.getWarehouses(page: page, limit: limit);
  }
}
