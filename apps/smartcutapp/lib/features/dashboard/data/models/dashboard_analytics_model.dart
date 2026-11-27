import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_analytics_model.freezed.dart';

part 'dashboard_analytics_model.g.dart';

@freezed
abstract class DashboardAnalyticsModel with _$DashboardAnalyticsModel {
  const factory DashboardAnalyticsModel({
    @Default(0) int totalOrders,
    @Default(0) int draftOrders,
    @Default(0) int approvedOrders,
    @Default(0) int activeOrders,
    @Default(0) int completedOrders,
    @Default(0) int shippedOrders,
    @Default(0) int deliveredOrders,
    @Default(0) int cancelledOrders,
    @Default(0) int ordersThisMonth,
    @Default(0) int totalCustomers,
    @Default(0) int totalProjects,
    @Default(0) int activeProjects,
    @Default(0) int availableSheets,
    @Default(0) int availableOffcuts,
    @Default(0) int pendingShipments,
    @Default(0) int dispatchedShipments,
    @Default(0) int inTransitShipments,
    @Default(0) int deliveredShipments,
    @Default(0) int cancelledShipments,
    @Default(0) int deliveriesThisMonth,
  }) = _DashboardAnalyticsModel;

  factory DashboardAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardAnalyticsModelFromJson(json);
}
