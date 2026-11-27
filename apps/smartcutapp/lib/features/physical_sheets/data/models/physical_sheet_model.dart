import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'physical_sheet_model.freezed.dart';

part 'physical_sheet_model.g.dart';

@freezed
abstract class PhysicalSheetModel with _$PhysicalSheetModel {
  const factory PhysicalSheetModel({
    required String id,
    required String sheetCode,
    required String companyId,
    required String materialId,
    required String warehouseId,
    required double width,
    required double height,
    required String type,
    required String status,
    required String grainDirection,
    String? parentId,
    DateTime? createdAt,
    DateTime? updatedAt,
    required PhysicalSheetMaterialModel material,
    required WarehouseModel warehouse,
  }) = _PhysicalSheetModel;

  factory PhysicalSheetModel.fromJson(Map<String, dynamic> json) =>
      _$PhysicalSheetModelFromJson(json);
}

@freezed
abstract class PhysicalSheetMaterialModel with _$PhysicalSheetMaterialModel {
  const factory PhysicalSheetMaterialModel({
    required String id,
    required String name,
    String? code,
  }) = _PhysicalSheetMaterialModel;

  factory PhysicalSheetMaterialModel.fromJson(Map<String, dynamic> json) =>
      _$PhysicalSheetMaterialModelFromJson(json);
}
