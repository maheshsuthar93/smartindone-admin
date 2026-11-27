// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String,
  orderNumber: (json['orderNumber'] as num).toInt(),
  companyId: json['companyId'] as String,
  projectId: json['projectId'] as String,
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  deliveryDate: DateTime.parse(json['deliveryDate'] as String),
  customer: OrderCustomerModel.fromJson(
    json['customer'] as Map<String, dynamic>,
  ),
  project: OrderProjectModel.fromJson(json['project'] as Map<String, dynamic>),
  factory: json['factory'] == null
      ? null
      : OrderFactoryModel.fromJson(json['factory'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'deliveryDate': instance.deliveryDate.toIso8601String(),
      'customer': instance.customer,
      'project': instance.project,
      'factory': instance.factory,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
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
