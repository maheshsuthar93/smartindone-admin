// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MachineFactoryModel _$MachineFactoryModelFromJson(Map<String, dynamic> json) =>
    _MachineFactoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$MachineFactoryModelToJson(
  _MachineFactoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
};

_MachineModel _$MachineModelFromJson(Map<String, dynamic> json) =>
    _MachineModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      type: $enumDecode(_$MachineTypeEnumMap, json['type']),
      factoryId: json['factoryId'] as String,
      factorySummary: _machineFactoryFromJson(json['factory']),
      isActive: json['isActive'] as bool? ?? true,
      kerf: (json['kerf'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MachineModelToJson(_MachineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': _$MachineTypeEnumMap[instance.type]!,
      'factoryId': instance.factoryId,
      'factory': _machineFactoryToJson(instance.factorySummary),
      'isActive': instance.isActive,
      'kerf': instance.kerf,
    };

const _$MachineTypeEnumMap = {
  MachineType.cnc: 'CNC',
  MachineType.panelSaw: 'PANEL_SAW',
  MachineType.edgeBander: 'EDGE_BANDER',
  MachineType.drilling: 'DRILLING',
  MachineType.other: 'OTHER',
};
