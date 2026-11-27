// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartRequestModel _$PartRequestModelFromJson(Map<String, dynamic> json) =>
    _PartRequestModel(
      orderItemId: json['orderItemId'] as String,
      name: json['name'] as String,
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      thickness: (json['thickness'] as num).toDouble(),
      rotatable: json['rotatable'] as bool? ?? true,
      grainDirection: $enumDecodeNullable(
        _$GrainDirectionEnumMap,
        json['grainDirection'],
      ),
      edgeBandTop: (json['edgeBandTop'] as num?)?.toDouble(),
      edgeBandBottom: (json['edgeBandBottom'] as num?)?.toDouble(),
      edgeBandLeft: (json['edgeBandLeft'] as num?)?.toDouble(),
      edgeBandRight: (json['edgeBandRight'] as num?)?.toDouble(),
      grain: json['grain'] as bool? ?? false,
      materialId: json['materialId'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$PartRequestModelToJson(_PartRequestModel instance) =>
    <String, dynamic>{
      'orderItemId': instance.orderItemId,
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'thickness': instance.thickness,
      'rotatable': instance.rotatable,
      'grainDirection': _$GrainDirectionEnumMap[instance.grainDirection],
      'edgeBandTop': instance.edgeBandTop,
      'edgeBandBottom': instance.edgeBandBottom,
      'edgeBandLeft': instance.edgeBandLeft,
      'edgeBandRight': instance.edgeBandRight,
      'grain': instance.grain,
      'materialId': instance.materialId,
      'quantity': instance.quantity,
    };

const _$GrainDirectionEnumMap = {
  GrainDirection.length: 'LENGTH',
  GrainDirection.width: 'WIDTH',
  GrainDirection.none: 'NONE',
};
