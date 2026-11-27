// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) =>
    _OrderDetailModel(
      id: json['id'] as String,
      orderCode: json['orderCode'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      description: json['description'] as String?,
      totalItems: (json['totalItems'] as num?)?.toInt(),
      totalPieces: (json['totalPieces'] as num?)?.toInt(),
      deliveryDate: DateTime.parse(json['deliveryDate'] as String),
      project: OrderDetailProjectModel.fromJson(
        json['project'] as Map<String, dynamic>,
      ),
      customer: OrderDetailCustomerModel.fromJson(
        json['customer'] as Map<String, dynamic>,
      ),
      counts: OrderDetailsCountsModel.fromJson(
        json['counts'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$OrderDetailModelToJson(_OrderDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderCode': instance.orderCode,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': _$OrderStatusEnumMap[instance.status]!,
      'description': instance.description,
      'totalItems': instance.totalItems,
      'totalPieces': instance.totalPieces,
      'deliveryDate': instance.deliveryDate.toIso8601String(),
      'project': instance.project,
      'customer': instance.customer,
      'counts': instance.counts,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.draft: 'DRAFT',
  OrderStatus.approved: 'APPROVED',
  OrderStatus.inProduction: 'IN_PRODUCTION',
  OrderStatus.completed: 'COMPLETED',
  OrderStatus.shipped: 'SHIPPED',
  OrderStatus.delivered: 'DELIVERED',
  OrderStatus.cancelled: 'CANCELLED',
};

_OrderDetailsCountsModel _$OrderDetailsCountsModelFromJson(
  Map<String, dynamic> json,
) => _OrderDetailsCountsModel(
  totalItems: (json['totalItems'] as num).toInt(),
  totalParts: (json['totalParts'] as num).toInt(),
  totalPieces: (json['totalPieces'] as num).toInt(),
);

Map<String, dynamic> _$OrderDetailsCountsModelToJson(
  _OrderDetailsCountsModel instance,
) => <String, dynamic>{
  'totalItems': instance.totalItems,
  'totalParts': instance.totalParts,
  'totalPieces': instance.totalPieces,
};
