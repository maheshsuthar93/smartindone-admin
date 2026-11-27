import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/optimizations/data/model/model.dart';

import '../../model/material_group_model.dart';

abstract class OptimizationsRemoteDataSource {
  Future<List<OptimizationModel>> getOptimizationsByOrderId({
    required String orderId,
  });

  Future<PaginatedResult<MaterialGroupModel>>
  getMaterialGroupsByOptimizationId({
    required String optimizationId,
    required int page,
    required int limit,
  });

  Future<List<OptimizationModel>> createOrderOptimization({
    required String orderId,
  });

  Future<ApiResponse> runOptimizationMaterialGroup({
    required String materialGroupId,
  });
}
