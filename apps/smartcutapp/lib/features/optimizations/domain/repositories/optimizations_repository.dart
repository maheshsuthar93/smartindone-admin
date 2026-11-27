import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/optimizations/data/model/model.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/material_group_model.dart';

abstract class OptimizationsRepository {
  Future<Either<Failure, List<OptimizationModel>>> getOptimizationsByOrderId({
    required String orderId,
  });

  Future<Either<Failure, PaginatedResult<MaterialGroupModel>>>
  getMaterialGroupsByOptimizationId({
    required String optimizationId,
    required int page,
    required int limit,
  });

  Future<Either<Failure, List<OptimizationModel>>> createOrderOptimization({
    required String orderId,
  });

  Future<Either<Failure, ApiResponse>>
  runOptimizationMaterialGroup({required String materialGroupId});
}
