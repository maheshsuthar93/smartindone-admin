import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/enums.dart';

part 'optimization_material_group_model.freezed.dart';

part 'optimization_material_group_model.g.dart';

@freezed
abstract class OptimizationMaterialGroupModel
    with _$OptimizationMaterialGroupModel {
  const factory OptimizationMaterialGroupModel({
    required String id,
    required String optimizationId,
    required String materialId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String status,
    required Optimization optimization,
    required MaterialModel material,
    required List<OptimizationPiece> pieces,
    required List<OptimizationLayoutModel> layouts,
  }) = _OptimizationMaterialGroupModel;

  factory OptimizationMaterialGroupModel.fromJson(Map<String, dynamic> json) =>
      _$OptimizationMaterialGroupModelFromJson(json);
}

@freezed
abstract class Optimization with _$Optimization {
  const factory Optimization({
    required String id,
    required String optimizationNo,
    required String orderId,
    required String status,
  }) = _Optimization;

  factory Optimization.fromJson(Map<String, dynamic> json) =>
      _$OptimizationFromJson(json);
}

@freezed
abstract class MaterialModel with _$MaterialModel {
  const factory MaterialModel({
    required String id,
    required String name,
    required String code,
    required MaterialType type,
    required int thickness,
    double? density,
    required DateTime createdAt,
    required DateTime updatedAt,
    double? defaultHeight,
    double? defaultLength,
    double? defaultWidth,
    required String unit,
  }) = _MaterialModel;

  factory MaterialModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialModelFromJson(json);
}

@freezed
abstract class Part with _$Part {
  const factory Part({
    required String id,
    required String name,
    required String materialId,
    required bool grain,
    required GrainDirection grainDirection,
    required bool rotatable,
  }) = _Part;

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);
}

@freezed
abstract class Piece2 with _$Piece2 {
  const factory Piece2({
    required String id,
    required String pieceCode,
    String? serialNo,
    required int width,
    required int height,
    required int thickness,
    required bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String partId,
    String? barcode,
    String? qrCode,
    int? edgeBandTop,
    int? edgeBandBottom,
    int? edgeBandLeft,
    int? edgeBandRight,
    @Default([]) List<OptimizationPieceProcess> pieceProcesses,
    Part? part,
  }) = _Piece2;

  factory Piece2.fromJson(Map<String, dynamic> json) => _$Piece2FromJson(json);
}

@freezed
abstract class OptimizationPieceProcess with _$OptimizationPieceProcess {
  const factory OptimizationPieceProcess({
    required String processTypeId,
    required ProcessStatus status,
  }) = _OptimizationPieceProcess;

  factory OptimizationPieceProcess.fromJson(Map<String, dynamic> json) =>
      _$OptimizationPieceProcessFromJson(json);
}

@freezed
abstract class OptimizationProcessType with _$OptimizationProcessType {
  const factory OptimizationProcessType({
    required String id,
    required String name,
    required int sequenceOrder,
    @Default(true) bool isActive,
  }) = _OptimizationProcessType;

  factory OptimizationProcessType.fromJson(Map<String, dynamic> json) =>
      _$OptimizationProcessTypeFromJson(json);
}

@freezed
abstract class OptimizationPiece with _$OptimizationPiece {
  const factory OptimizationPiece({
    required String id,
    required String materialGroupId,
    required String pieceId,
    required Piece2 piece,
  }) = _OptimizationPiece;

  factory OptimizationPiece.fromJson(Map<String, dynamic> json) =>
      _$OptimizationPieceFromJson(json);
}

@freezed
abstract class LayoutItem with _$LayoutItem {
  const factory LayoutItem({
    required String id,
    required String optimizationSheetId,
    required String optimizationPieceId,
    required double x,
    required double y,
    required double width,
    required double height,
    required bool rotated,
    required DateTime createdAt,
    required OptimizationPiece optimizationPiece,
  }) = _LayoutItem;

  factory LayoutItem.fromJson(Map<String, dynamic> json) =>
      _$LayoutItemFromJson(json);
}

@freezed
abstract class OptimizationSheetModel with _$OptimizationSheetModel {
  const factory OptimizationSheetModel({
    required String id,
    required String layoutId,
    String? sheetId,
    required int sheetNo,
    required double width,
    required double height,
    PhysicalSheetOrientation? sheet,
    double? utilizationPercent,
    double? wasteArea,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<LayoutItem> layoutItems,
    @Default([]) List<RemainingArea> remainingAreas,
  }) = _OptimizationSheetModel;

  factory OptimizationSheetModel.fromJson(Map<String, dynamic> json) =>
      _$OptimizationSheetModelFromJson(json);
}

@freezed
abstract class PhysicalSheetOrientation with _$PhysicalSheetOrientation {
  const factory PhysicalSheetOrientation({
    required String id,
    required double width,
    required double height,
    required GrainDirection grainDirection,
  }) = _PhysicalSheetOrientation;

  factory PhysicalSheetOrientation.fromJson(Map<String, dynamic> json) =>
      _$PhysicalSheetOrientationFromJson(json);
}

@freezed
abstract class OptimizationLayoutModel with _$OptimizationLayoutModel {
  const factory OptimizationLayoutModel({
    required String id,
    String? layoutNo,
    required String materialGroupId,
    required LayoutStatus status,
    String? efficiencyPercent,
    String? totalWasteArea,
    String? totalSheetArea,
    required int sheetCount,
    String? algorithmVersion,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<OptimizationSheetModel> sheets,
  }) = _OptimizationLayoutModel;

  factory OptimizationLayoutModel.fromJson(Map<String, dynamic> json) =>
      _$OptimizationLayoutModelFromJson(json);
}

@freezed
abstract class RemainingArea with _$RemainingArea {
  const factory RemainingArea({
    required String id,
    required double x,
    required double y,
    required double width,
    required double height,
    required RemainingAreaStatus status,
  }) = _RemainingArea;

  factory RemainingArea.fromJson(Map<String, dynamic> json) =>
      _$RemainingAreaFromJson(json);
}
