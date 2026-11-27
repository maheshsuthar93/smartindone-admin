// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartModel _$PartModelFromJson(Map<String, dynamic> json) => _PartModel(
  id: json['id'] as String,
  orderItemId: json['orderItemId'] as String,
  name: json['name'] as String,
  width: (json['width'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  thickness: (json['thickness'] as num).toDouble(),
  grain: json['grain'] as bool,
  quantity: (json['quantity'] as num).toInt(),
  grainDirection: $enumDecode(_$GrainDirectionEnumMap, json['grainDirection']),
  materialId: json['materialId'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  material: MaterialModel.fromJson(json['material'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PartModelToJson(_PartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderItemId': instance.orderItemId,
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'thickness': instance.thickness,
      'grain': instance.grain,
      'quantity': instance.quantity,
      'grainDirection': _$GrainDirectionEnumMap[instance.grainDirection]!,
      'materialId': instance.materialId,
      'createdAt': instance.createdAt.toIso8601String(),
      'material': instance.material,
    };

const _$GrainDirectionEnumMap = {
  GrainDirection.length: 'LENGTH',
  GrainDirection.width: 'WIDTH',
  GrainDirection.none: 'NONE',
};

_MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) =>
    _MaterialModel(
      name: json['name'] as String,
      code: json['code'] as String,
      type: $enumDecode(_$MaterialTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$MaterialModelToJson(_MaterialModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'type': _$MaterialTypeEnumMap[instance.type]!,
    };

const _$MaterialTypeEnumMap = {
  MaterialType.mdf: 'MDF',
  MaterialType.hdhmr: 'HDHMR',
  MaterialType.plywood: 'PLYWOOD',
  MaterialType.particleBoard: 'PARTICLE_BOARD',
  MaterialType.laminate: 'LAMINATE',
  MaterialType.acrylic: 'ACRYLIC',
  MaterialType.aluminium: 'ALUMINIUM',
  MaterialType.other: 'OTHER',
  MaterialType.consumable: 'CONSUMABLE',
  MaterialType.unknown: 'UNKNOWN',
};
