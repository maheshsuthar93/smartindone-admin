// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'physical_sheet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhysicalSheetModel _$PhysicalSheetModelFromJson(Map<String, dynamic> json) =>
    _PhysicalSheetModel(
      id: json['id'] as String,
      sheetCode: json['sheetCode'] as String,
      companyId: json['companyId'] as String,
      materialId: json['materialId'] as String,
      warehouseId: json['warehouseId'] as String,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      type: json['type'] as String,
      status: json['status'] as String,
      grainDirection: json['grainDirection'] as String,
      parentId: json['parentId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      material: PhysicalSheetMaterialModel.fromJson(
        json['material'] as Map<String, dynamic>,
      ),
      warehouse: WarehouseModel.fromJson(
        json['warehouse'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PhysicalSheetModelToJson(_PhysicalSheetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sheetCode': instance.sheetCode,
      'companyId': instance.companyId,
      'materialId': instance.materialId,
      'warehouseId': instance.warehouseId,
      'width': instance.width,
      'height': instance.height,
      'type': instance.type,
      'status': instance.status,
      'grainDirection': instance.grainDirection,
      'parentId': instance.parentId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'material': instance.material,
      'warehouse': instance.warehouse,
    };

_PhysicalSheetMaterialModel _$PhysicalSheetMaterialModelFromJson(
  Map<String, dynamic> json,
) => _PhysicalSheetMaterialModel(
  id: json['id'] as String,
  name: json['name'] as String,
  code: json['code'] as String?,
);

Map<String, dynamic> _$PhysicalSheetMaterialModelToJson(
  _PhysicalSheetMaterialModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
};
