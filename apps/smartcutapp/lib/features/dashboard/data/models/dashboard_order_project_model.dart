import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_order_project_model.freezed.dart';

part 'dashboard_order_project_model.g.dart';

@freezed
abstract class DashboardOrderProjectModel with _$DashboardOrderProjectModel {
  const factory DashboardOrderProjectModel({
    required String id,
    required String name,
  }) = _DashboardOrderProjectModel;

  factory DashboardOrderProjectModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardOrderProjectModelFromJson(json);
}
