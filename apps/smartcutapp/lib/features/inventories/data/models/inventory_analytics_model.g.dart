// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryAnalyticsModel _$InventoryAnalyticsModelFromJson(
  Map<String, dynamic> json,
) => _InventoryAnalyticsModel(
  total: (json['total'] as num).toInt(),
  materialCount: (json['materialCount'] as num).toInt(),
  hardwareCount: (json['hardwareCount'] as num).toInt(),
  onHand: (json['onHand'] as num).toInt(),
  reserved: (json['reserved'] as num).toInt(),
  available: (json['available'] as num).toInt(),
);

Map<String, dynamic> _$InventoryAnalyticsModelToJson(
  _InventoryAnalyticsModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'materialCount': instance.materialCount,
  'hardwareCount': instance.hardwareCount,
  'onHand': instance.onHand,
  'reserved': instance.reserved,
  'available': instance.available,
};
