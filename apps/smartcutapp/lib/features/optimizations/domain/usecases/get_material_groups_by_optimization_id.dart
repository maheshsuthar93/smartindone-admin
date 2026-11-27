import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/material_group_model.dart';
import '../repositories/optimizations_repository.dart';

class GetMaterialGroupsByOptimizationId {
  final OptimizationsRepository repository;

  GetMaterialGroupsByOptimizationId(this.repository);

  Future<Either<Failure, PaginatedResult<MaterialGroupModel>>> call({
    required String optimizationId,
    required int page,
    required int limit,
  }) async {
    return repository.getMaterialGroupsByOptimizationId(
      optimizationId: optimizationId,
      page: page,
      limit: limit,
    );
  }
}
