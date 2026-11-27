import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/optimizations_repository.dart';

class RunOptimizationMaterialGroup {
  final OptimizationsRepository repository;

  RunOptimizationMaterialGroup(this.repository);

  Future<Either<Failure, ApiResponse>> call({
    required String materialGroupId,
  }) async {
    return repository.runOptimizationMaterialGroup(
      materialGroupId: materialGroupId,
    );
  }
}
