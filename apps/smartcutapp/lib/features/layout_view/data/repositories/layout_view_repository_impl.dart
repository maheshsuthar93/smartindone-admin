import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/layout_view/data/model/sheet_detail_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/layout_view_repository.dart';
import '../data_sources/remote/layout_view_remote_data_source.dart';
import '../model/optimization_material_group_model.dart';

class LayoutViewRepositoryImpl implements LayoutViewRepository {
  final LayoutViewRemoteDataSource remoteDataSource;

  LayoutViewRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, OptimizationMaterialGroupModel>> getMaterialGroupById({
    required String materialGroupId,
  }) async {
    return safeCall(
      () => remoteDataSource.getMaterialGroupById(
        materialGroupId: materialGroupId,
      ),
    );
  }

  @override
  Future<Either<Failure, List<OptimizationProcessType>>>
  getPieceProcessTypes() {
    return safeCall(remoteDataSource.getPieceProcessTypes);
  }

  @override
  Future<Either<Failure, SheetDetailModel>> getSheetById({
    required String sheetId,
  }) {
    return safeCall(() => remoteDataSource.getSheetById(sheetId: sheetId));
  }

  @override
  Future<Either<Failure, ApiResponse>> selectOptimizationLayout({
    required String layoutId,
  }) {
    return safeCall(
      () => remoteDataSource.selectOptimizationLayout(layoutId: layoutId),
    );
  }

  @override
  Future<Either<Failure, OptimizationLayoutModel>> getOptimizationLayoutById({
    required String layoutId,
  }) => safeCall(
    () => remoteDataSource.getOptimizationLayoutById(layoutId: layoutId),
  );

  @override
  Future<Either<Failure, ApiResponse>> cancelOptimizationLayout({
    required String layoutId,
  }) => safeCall(
    () => remoteDataSource.cancelOptimizationLayout(layoutId: layoutId),
  );

  @override
  Future<Either<Failure, ApiResponse>> completeOptimizationProduction({
    required String layoutId,
  }) => safeCall(
    () => remoteDataSource.completeOptimizationProduction(layoutId: layoutId),
  );

  @override
  Future<Either<Failure, ApiResponse>> classifyRemainingArea({
    required String remainingAreaId,
    required RemainingAreaStatus status,
  }) => safeCall(
    () => remoteDataSource.classifyRemainingArea(
      remainingAreaId: remainingAreaId,
      status: status,
    ),
  );
}
