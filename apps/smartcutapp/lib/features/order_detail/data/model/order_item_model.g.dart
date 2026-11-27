// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      quantity: (json['quantity'] as num).toInt(),
      overallWidth: (json['overallWidth'] as num?)?.toInt(),
      overallHeight: (json['overallHeight'] as num?)?.toInt(),
      overallDepth: (json['overallDepth'] as num?)?.toInt(),
      production: ProductionModel.fromJson(
        json['production'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'quantity': instance.quantity,
      'overallWidth': instance.overallWidth,
      'overallHeight': instance.overallHeight,
      'overallDepth': instance.overallDepth,
      'production': instance.production,
    };

_ProductionModel _$ProductionModelFromJson(Map<String, dynamic> json) =>
    _ProductionModel(
      status: $enumDecode(_$ItemStatusEnumMap, json['status']),
      totalPieces: (json['totalPieces'] as num).toInt(),
      completedPieces: (json['completedPieces'] as num).toInt(),
      pendingPieces: (json['pendingPieces'] as num).toInt(),
      progressPercent: (json['progressPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductionModelToJson(_ProductionModel instance) =>
    <String, dynamic>{
      'status': _$ItemStatusEnumMap[instance.status]!,
      'totalPieces': instance.totalPieces,
      'completedPieces': instance.completedPieces,
      'pendingPieces': instance.pendingPieces,
      'progressPercent': instance.progressPercent,
    };

const _$ItemStatusEnumMap = {
  ItemStatus.pending: 'PENDING',
  ItemStatus.inProgress: 'IN_PROGRESS',
  ItemStatus.completed: 'COMPLETED',
  ItemStatus.unknown: 'UNKNOWN',
};
