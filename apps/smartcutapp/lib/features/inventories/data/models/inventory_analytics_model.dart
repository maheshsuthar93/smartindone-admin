import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_analytics_model.freezed.dart';

part 'inventory_analytics_model.g.dart';

@freezed
abstract class InventoryAnalyticsModel with _$InventoryAnalyticsModel {
  const factory InventoryAnalyticsModel({
    required int total,
    required int materialCount,
    required int hardwareCount,
    required int onHand,
    required int reserved,
    required int available,
  }) = _InventoryAnalyticsModel;

  factory InventoryAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryAnalyticsModelFromJson(json);
}
