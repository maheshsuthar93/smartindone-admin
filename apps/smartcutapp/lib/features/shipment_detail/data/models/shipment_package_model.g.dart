// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShipmentPackageModel _$ShipmentPackageModelFromJson(
  Map<String, dynamic> json,
) => _ShipmentPackageModel(
  id: json['id'] as String,
  pieceNumber: (json['pieceNumber'] as num?)?.toInt() ?? 0,
  pieceCode: json['pieceCode'] as String? ?? '',
  status: json['status'] as String?,
  itemsCount: (json['itemsCount'] as num?)?.toInt(),
  hardwareCount: (json['hardwareCount'] as num?)?.toInt(),
  weight: json['weight'] as num?,
  length: json['length'] as num?,
  width: json['width'] as num?,
  height: json['height'] as num?,
);

Map<String, dynamic> _$ShipmentPackageModelToJson(
  _ShipmentPackageModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'pieceNumber': instance.pieceNumber,
  'pieceCode': instance.pieceCode,
  'status': instance.status,
  'itemsCount': instance.itemsCount,
  'hardwareCount': instance.hardwareCount,
  'weight': instance.weight,
  'length': instance.length,
  'width': instance.width,
  'height': instance.height,
};
