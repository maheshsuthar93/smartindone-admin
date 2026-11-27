// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaterialGroupModel _$MaterialGroupModelFromJson(Map<String, dynamic> json) =>
    _MaterialGroupModel(
      id: json['id'] as String,
      status: $enumDecode(_$MaterialGroupStatusEnumMap, json['status']),
      material: MaterialModel.fromJson(
        json['material'] as Map<String, dynamic>,
      ),
      pieceCount: (json['pieceCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MaterialGroupModelToJson(_MaterialGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$MaterialGroupStatusEnumMap[instance.status]!,
      'material': instance.material,
      'pieceCount': instance.pieceCount,
    };

const _$MaterialGroupStatusEnumMap = {
  MaterialGroupStatus.ready: 'READY',
  MaterialGroupStatus.optimizing: 'OPTIMIZING',
  MaterialGroupStatus.completed: 'COMPLETED',
  MaterialGroupStatus.failed: 'FAILED',
  MaterialGroupStatus.unknown: 'UNKNOWN',
};

_MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) =>
    _MaterialModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      type: json['type'] as String,
      thickness: (json['thickness'] as num).toInt(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$MaterialModelToJson(_MaterialModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': instance.type,
      'thickness': instance.thickness,
      'unit': instance.unit,
    };
