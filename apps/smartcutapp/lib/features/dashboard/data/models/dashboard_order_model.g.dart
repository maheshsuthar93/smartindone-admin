// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardOrderModel _$DashboardOrderModelFromJson(Map<String, dynamic> json) =>
    _DashboardOrderModel(
      id: json['id'] as String,
      orderCode: json['orderCode'] as String,
      companyId: json['companyId'] as String,
      projectId: json['projectId'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      deliveryDate: DateTime.parse(json['deliveryDate'] as String),
      customer: DashboardOrderCustomerModel.fromJson(
        json['customer'] as Map<String, dynamic>,
      ),
      project: DashboardOrderProjectModel.fromJson(
        json['project'] as Map<String, dynamic>,
      ),
      factory: json['factory'] == null
          ? null
          : DashboardOrderFactoryModel.fromJson(
              json['factory'] as Map<String, dynamic>,
            ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DashboardOrderModelToJson(
  _DashboardOrderModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'orderCode': instance.orderCode,
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
