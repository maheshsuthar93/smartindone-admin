// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SheetDetailModel _$SheetDetailModelFromJson(Map<String, dynamic> json) =>
    _SheetDetailModel(
      id: json['id'] as String,
      materialId: json['materialId'] as String,
      warehouseId: json['warehouseId'] as String,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      thickness: (json['thickness'] as num).toDouble(),
      type: $enumDecode(_$SheetTypeEnumMap, json['type']),
      status: $enumDecode(_$SheetStatusEnumMap, json['status']),
      isOffcut: json['isOffcut'] as bool,
      projectId: json['projectId'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      parentId: json['parentId'] as String?,
      material: SheetMaterialModel.fromJson(
        json['material'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SheetDetailModelToJson(_SheetDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'materialId': instance.materialId,
      'warehouseId': instance.warehouseId,
      'width': instance.width,
      'height': instance.height,
      'thickness': instance.thickness,
      'type': _$SheetTypeEnumMap[instance.type]!,
      'status': _$SheetStatusEnumMap[instance.status]!,
      'isOffcut': instance.isOffcut,
      'projectId': instance.projectId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'parentId': instance.parentId,
      'material': instance.material,
    };

const _$SheetTypeEnumMap = {
  SheetType.full: 'FULL',
  SheetType.offcut: 'OFFCUT',
  SheetType.unknown: 'UNKNOWN',
};

const _$SheetStatusEnumMap = {
  SheetStatus.available: 'AVAILABLE',
  SheetStatus.reserved: 'RESERVED',
  SheetStatus.inProduction: 'IN_PRODUCTION',
  SheetStatus.used: 'USED',
  SheetStatus.scraped: 'SCRAPPED',
  SheetStatus.unknown: 'UNKNOWN',
};

_SheetMaterialModel _$SheetMaterialModelFromJson(Map<String, dynamic> json) =>
    _SheetMaterialModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      thickness: (json['thickness'] as num).toDouble(),
      density: (json['density'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      defaultHeight: (json['defaultHeight'] as num?)?.toDouble(),
      defaultLength: (json['defaultLength'] as num?)?.toDouble(),
      defaultWidth: (json['defaultWidth'] as num?)?.toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$SheetMaterialModelToJson(_SheetMaterialModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'thickness': instance.thickness,
      'density': instance.density,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'defaultHeight': instance.defaultHeight,
      'defaultLength': instance.defaultLength,
      'defaultWidth': instance.defaultWidth,
      'unit': instance.unit,
    };
