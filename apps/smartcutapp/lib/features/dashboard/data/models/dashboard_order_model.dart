import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'dashboard_order_customer_model.dart';
import 'dashboard_order_factory_model.dart';
import 'dashboard_order_project_model.dart';

part 'dashboard_order_model.freezed.dart';

part 'dashboard_order_model.g.dart';

@freezed
abstract class DashboardOrderModel with _$DashboardOrderModel {
  const factory DashboardOrderModel({
    required String id,
    required String orderCode,
    required String companyId,
    required String projectId,
    required OrderStatus status,
    required DateTime deliveryDate,
    required DashboardOrderCustomerModel customer,
    required DashboardOrderProjectModel project,
    DashboardOrderFactoryModel? factory,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _DashboardOrderModel;

  factory DashboardOrderModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardOrderModelFromJson(json);
}
