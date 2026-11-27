import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/layout_view/data/model/model.dart';
import 'package:fpdart/fpdart.dart';

abstract class LayoutViewRepository {
  Future<Either<Failure, OptimizationMaterialGroupModel>> getMaterialGroupById({
    required String materialGroupId,
  });

  Future<Either<Failure, List<OptimizationProcessType>>> getPieceProcessTypes();

  Future<Either<Failure, SheetDetailModel>> getSheetById({
    required String sheetId,
  });

  Future<Either<Failure, ApiResponse>> selectOptimizationLayout({
    required String layoutId,
  });

  Future<Either<Failure, OptimizationLayoutModel>> getOptimizationLayoutById({
    required String layoutId,
  });

  Future<Either<Failure, ApiResponse>> cancelOptimizationLayout({
    required String layoutId,
  });

  Future<Either<Failure, ApiResponse>> completeOptimizationProduction({
    required String layoutId,
  });

  Future<Either<Failure, ApiResponse>> classifyRemainingArea({
    required String remainingAreaId,
    required RemainingAreaStatus status,
  });
}
