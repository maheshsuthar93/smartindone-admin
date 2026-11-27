import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/optimizations/data/model/material_group_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/optimizations_repository.dart';
import '../data_sources/remote/optimizations_remote_data_source.dart';
import '../model/optimization_model.dart';

class OptimizationsRepositoryImpl implements OptimizationsRepository {
  final OptimizationsRemoteDataSource remoteDataSource;

  OptimizationsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<OptimizationModel>>> getOptimizationsByOrderId({
    required String orderId,
  }) async {
    return safeCall(
      () => remoteDataSource.getOptimizationsByOrderId(orderId: orderId),
    );
  }

  @override
  Future<Either<Failure, PaginatedResult<MaterialGroupModel>>>
  getMaterialGroupsByOptimizationId({
    required String optimizationId,
    required int page,
    required int limit,
  }) {
    return safeCall(
      () => remoteDataSource.getMaterialGroupsByOptimizationId(
        optimizationId: optimizationId,
        page: page,
        limit: limit,
      ),
    );
  }

  @override
  Future<Either<Failure, List<OptimizationModel>>> createOrderOptimization({
    required String orderId,
  }) {
    return safeCall(
      () => remoteDataSource.createOrderOptimization(orderId: orderId),
    );
  }

  @override
  Future<Either<Failure, ApiResponse>> runOptimizationMaterialGroup({
    required String materialGroupId,
  }) {
    return safeCall(
      () => remoteDataSource.runOptimizationMaterialGroup(
        materialGroupId: materialGroupId,
      ),
    );
  }
}
