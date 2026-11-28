// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarehouseModel _$WarehouseModelFromJson(Map<String, dynamic> json) =>
    _WarehouseModel(
      id: json['id'] as String,
      companyId: json['companyId'] as String,
      factoryId: json['factoryId'] as String,
      location: json['location'] as String?,
      name: json['name'] as String,
      contactName: json['contactName'] as String?,
      contactEmail: json['contactEmail'] as String?,
      contactPhone: json['contactPhone'] as String?,
      status: $enumDecode(_$WarehouseStatusEnumMap, json['status']),
      factoryName: _readFactoryName(json, 'factoryName') as String? ?? '',
      factoryCode: _readFactoryCode(json, 'factoryCode') as String?,
      inventoryBalanceCount:
          (_readInventoryBalanceCount(json, 'inventoryBalanceCount') as num?)
              ?.toInt() ??
          0,
      sheetCount: (_readSheetCount(json, 'sheetCount') as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WarehouseModelToJson(_WarehouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'factoryId': instance.factoryId,
      'location': instance.location,
      'name': instance.name,
      'contactName': instance.contactName,
      'contactEmail': instance.contactEmail,
      'contactPhone': instance.contactPhone,
      'status': _$WarehouseStatusEnumMap[instance.status]!,
    };

const _$WarehouseStatusEnumMap = {
  WarehouseStatus.active: 'ACTIVE',
  WarehouseStatus.inActive: 'INACTIVE',
  WarehouseStatus.underMaintenance: 'UNDER_MAINTENANCE',
};
