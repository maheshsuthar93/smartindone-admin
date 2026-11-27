// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_package_hardware_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvailablePackageHardwareModel _$AvailablePackageHardwareModelFromJson(
  Map<String, dynamic> json,
) => _AvailablePackageHardwareModel(
  id: json['id'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  unit: json['unit'] as String,
  availableStock: (json['availableStock'] as num?)?.toInt() ?? 0,
  brand: json['brand'] as String?,
  finish: json['finish'] as String?,
  specification: json['specification'] as String?,
);

Map<String, dynamic> _$AvailablePackageHardwareModelToJson(
  _AvailablePackageHardwareModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'type': instance.type,
  'unit': instance.unit,
  'availableStock': instance.availableStock,
  'brand': instance.brand,
  'finish': instance.finish,
  'specification': instance.specification,
};
