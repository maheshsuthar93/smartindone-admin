import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_order_customer_model.freezed.dart';

part 'dashboard_order_customer_model.g.dart';

@freezed
abstract class DashboardOrderCustomerModel with _$DashboardOrderCustomerModel {
  const factory DashboardOrderCustomerModel({
    required String id,
    required String name,
  }) = _DashboardOrderCustomerModel;

  factory DashboardOrderCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardOrderCustomerModelFromJson(json);
}
