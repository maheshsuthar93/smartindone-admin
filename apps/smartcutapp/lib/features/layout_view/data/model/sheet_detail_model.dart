import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sheet_detail_model.freezed.dart';

part 'sheet_detail_model.g.dart';

@freezed
abstract class SheetDetailModel with _$SheetDetailModel {
  const factory SheetDetailModel({
    required String id,
    required String materialId,
    required String warehouseId,
    required double width,
    required double height,
    required double thickness,
    required SheetType type,
    required SheetStatus status,
    required bool isOffcut,
    String? projectId,
    required String createdAt,
    required String updatedAt,
    String? parentId,
    required SheetMaterialModel material,
  }) = _SheetDetailModel;

  factory SheetDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SheetDetailModelFromJson(json);
}

@freezed
abstract class SheetMaterialModel with _$SheetMaterialModel {
  const factory SheetMaterialModel({
    required String id,
    required String name,
    required String code,
    required double thickness,
    double? density,
    required String createdAt,
    required String updatedAt,
    double? defaultHeight,
    double? defaultLength,
    double? defaultWidth,
    required String unit,
  }) = _SheetMaterialModel;

  factory SheetMaterialModel.fromJson(Map<String, dynamic> json) =>
      _$SheetMaterialModelFromJson(json);
}
