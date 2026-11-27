// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryModel _$InventoryModelFromJson(Map<String, dynamic> json) =>
    _InventoryModel(
      id: json['id'] as String,
      materialId: json['materialId'] as String?,
      hardwareId: json['hardwareId'] as String?,
      available: (json['available'] as num).toInt(),
      onHand: (json['onHand'] as num).toInt(),
      reserved: (json['reserved'] as num).toInt(),
      warehouse: WarehouseModel.fromJson(
        json['warehouse'] as Map<String, dynamic>,
      ),
      material: json['material'] == null
          ? null
          : InventoryMaterialModel.fromJson(
              json['material'] as Map<String, dynamic>,
            ),
      hardware: json['hardware'] == null
          ? null
          : InventoryHardwareModel.fromJson(
              json['hardware'] as Map<String, dynamic>,
            ),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$InventoryModelToJson(_InventoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'materialId': instance.materialId,
      'hardwareId': instance.hardwareId,
      'available': instance.available,
      'onHand': instance.onHand,
      'reserved': instance.reserved,
      'warehouse': instance.warehouse,
      'material': instance.material,
      'hardware': instance.hardware,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_WarehouseModel _$WarehouseModelFromJson(Map<String, dynamic> json) =>
    _WarehouseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      factory: FactoryModel.fromJson(json['factory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WarehouseModelToJson(_WarehouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'factory': instance.factory,
    };

_FactoryModel _$FactoryModelFromJson(Map<String, dynamic> json) =>
    _FactoryModel(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$FactoryModelToJson(_FactoryModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
