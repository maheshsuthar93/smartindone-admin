// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardAnalyticsModel _$DashboardAnalyticsModelFromJson(
  Map<String, dynamic> json,
) => _DashboardAnalyticsModel(
  totalOrders: (json['totalOrders'] as num?)?.toInt() ?? 0,
  draftOrders: (json['draftOrders'] as num?)?.toInt() ?? 0,
  approvedOrders: (json['approvedOrders'] as num?)?.toInt() ?? 0,
  activeOrders: (json['activeOrders'] as num?)?.toInt() ?? 0,
  completedOrders: (json['completedOrders'] as num?)?.toInt() ?? 0,
  shippedOrders: (json['shippedOrders'] as num?)?.toInt() ?? 0,
  deliveredOrders: (json['deliveredOrders'] as num?)?.toInt() ?? 0,
  cancelledOrders: (json['cancelledOrders'] as num?)?.toInt() ?? 0,
  ordersThisMonth: (json['ordersThisMonth'] as num?)?.toInt() ?? 0,
  totalCustomers: (json['totalCustomers'] as num?)?.toInt() ?? 0,
  totalProjects: (json['totalProjects'] as num?)?.toInt() ?? 0,
  activeProjects: (json['activeProjects'] as num?)?.toInt() ?? 0,
  availableSheets: (json['availableSheets'] as num?)?.toInt() ?? 0,
  availableOffcuts: (json['availableOffcuts'] as num?)?.toInt() ?? 0,
  pendingShipments: (json['pendingShipments'] as num?)?.toInt() ?? 0,
  dispatchedShipments: (json['dispatchedShipments'] as num?)?.toInt() ?? 0,
  inTransitShipments: (json['inTransitShipments'] as num?)?.toInt() ?? 0,
  deliveredShipments: (json['deliveredShipments'] as num?)?.toInt() ?? 0,
  cancelledShipments: (json['cancelledShipments'] as num?)?.toInt() ?? 0,
  deliveriesThisMonth: (json['deliveriesThisMonth'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DashboardAnalyticsModelToJson(
  _DashboardAnalyticsModel instance,
) => <String, dynamic>{
  'totalOrders': instance.totalOrders,
  'draftOrders': instance.draftOrders,
  'approvedOrders': instance.approvedOrders,
  'activeOrders': instance.activeOrders,
  'completedOrders': instance.completedOrders,
  'shippedOrders': instance.shippedOrders,
  'deliveredOrders': instance.deliveredOrders,
  'cancelledOrders': instance.cancelledOrders,
  'ordersThisMonth': instance.ordersThisMonth,
  'totalCustomers': instance.totalCustomers,
  'totalProjects': instance.totalProjects,
  'activeProjects': instance.activeProjects,
  'availableSheets': instance.availableSheets,
  'availableOffcuts': instance.availableOffcuts,
  'pendingShipments': instance.pendingShipments,
  'dispatchedShipments': instance.dispatchedShipments,
  'inTransitShipments': instance.inTransitShipments,
  'deliveredShipments': instance.deliveredShipments,
  'cancelledShipments': instance.cancelledShipments,
  'deliveriesThisMonth': instance.deliveriesThisMonth,
};
