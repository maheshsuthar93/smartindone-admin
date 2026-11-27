import 'package:board_cut/core/core.dart';

import '../../model/optimization_material_group_model.dart';
import '../../model/sheet_detail_model.dart';

abstract class LayoutViewRemoteDataSource {
  Future<OptimizationMaterialGroupModel> getMaterialGroupById({
    required String materialGroupId,
  });

  Future<List<OptimizationProcessType>> getPieceProcessTypes();

  Future<SheetDetailModel> getSheetById({required String sheetId});

  Future<ApiResponse> selectOptimizationLayout({required String layoutId});

  Future<OptimizationLayoutModel> getOptimizationLayoutById({
    required String layoutId,
  });

  Future<ApiResponse> cancelOptimizationLayout({required String layoutId});

  Future<ApiResponse> completeOptimizationProduction({
    required String layoutId,
  });

  Future<ApiResponse> classifyRemainingArea({
    required String remainingAreaId,
    required RemainingAreaStatus status,
  });
}
