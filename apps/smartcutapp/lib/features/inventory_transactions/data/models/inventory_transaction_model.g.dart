// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryTransactionModel _$InventoryTransactionModelFromJson(
  Map<String, dynamic> json,
) => _InventoryTransactionModel(
  id: json['id'] as String,
  materialId: json['materialId'] as String?,
  hardwareId: json['hardwareId'] as String?,
  warehouseId: json['warehouseId'] as String,
  quantityChange: (json['quantityChange'] as num).toDouble(),
  transactionType: json['transactionType'] as String,
  notes: json['notes'] as String?,
  referenceType: json['referenceType'] as String?,
  referenceId: json['referenceId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  material: json['material'] == null
      ? null
      : TransactionItemModel.fromJson(json['material'] as Map<String, dynamic>),
  hardware: json['hardware'] == null
      ? null
      : TransactionItemModel.fromJson(json['hardware'] as Map<String, dynamic>),
  warehouse: json['warehouse'] == null
      ? null
      : TransactionWarehouseModel.fromJson(
          json['warehouse'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$InventoryTransactionModelToJson(
  _InventoryTransactionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'materialId': instance.materialId,
  'hardwareId': instance.hardwareId,
  'warehouseId': instance.warehouseId,
  'quantityChange': instance.quantityChange,
  'transactionType': instance.transactionType,
  'notes': instance.notes,
  'referenceType': instance.referenceType,
  'referenceId': instance.referenceId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'material': instance.material,
  'hardware': instance.hardware,
  'warehouse': instance.warehouse,
};

_TransactionItemModel _$TransactionItemModelFromJson(
  Map<String, dynamic> json,
) => _TransactionItemModel(
  id: json['id'] as String,
  name: json['name'] as String,
  code: json['code'] as String?,
  unit: json['unit'] as String?,
);

Map<String, dynamic> _$TransactionItemModelToJson(
  _TransactionItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'unit': instance.unit,
};

_TransactionWarehouseModel _$TransactionWarehouseModelFromJson(
  Map<String, dynamic> json,
) => _TransactionWarehouseModel(
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$TransactionWarehouseModelToJson(
  _TransactionWarehouseModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
