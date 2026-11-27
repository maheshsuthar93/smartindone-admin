// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartDetailModel _$PartDetailModelFromJson(Map<String, dynamic> json) =>
    _PartDetailModel(
      id: json['id'] as String,
      partNumber: (json['partNumber'] as num).toInt(),
      orderItemId: json['orderItemId'] as String,
      name: json['name'] as String,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      thickness: (json['thickness'] as num).toDouble(),
      grain: json['grain'] as bool,
      rotatable: json['rotatable'] as bool? ?? true,
      isDeleted: json['isDeleted'] as bool?,
      quantity: (json['quantity'] as num).toInt(),
      materialId: json['materialId'] as String?,
      grainDirection: $enumDecodeNullable(
        _$GrainDirectionEnumMap,
        json['grainDirection'],
      ),
      edgeBandTop: (json['edgeBandTop'] as num?)?.toDouble(),
      edgeBandBottom: (json['edgeBandBottom'] as num?)?.toDouble(),
      edgeBandLeft: (json['edgeBandLeft'] as num?)?.toDouble(),
      edgeBandRight: (json['edgeBandRight'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      material: MaterialModel.fromJson(
        json['material'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PartDetailModelToJson(_PartDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'partNumber': instance.partNumber,
      'orderItemId': instance.orderItemId,
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'thickness': instance.thickness,
      'grain': instance.grain,
      'rotatable': instance.rotatable,
      'isDeleted': instance.isDeleted,
      'quantity': instance.quantity,
      'materialId': instance.materialId,
      'grainDirection': _$GrainDirectionEnumMap[instance.grainDirection],
      'edgeBandTop': instance.edgeBandTop,
      'edgeBandBottom': instance.edgeBandBottom,
      'edgeBandLeft': instance.edgeBandLeft,
      'edgeBandRight': instance.edgeBandRight,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'material': instance.material,
    };

const _$GrainDirectionEnumMap = {
  GrainDirection.length: 'LENGTH',
  GrainDirection.width: 'WIDTH',
  GrainDirection.none: 'NONE',
};

_MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) =>
    _MaterialModel(
      id: json['id'] as String,
      name: json['name'] as String,
      thickness: (json['thickness'] as num).toDouble(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$MaterialModelToJson(_MaterialModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thickness': instance.thickness,
      'type': instance.type,
    };
