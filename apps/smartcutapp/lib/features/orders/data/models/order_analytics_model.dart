import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_analytics_model.freezed.dart';
part 'order_analytics_model.g.dart';

@freezed
abstract class OrderAnalyticsModel with _$OrderAnalyticsModel {
  const factory OrderAnalyticsModel({
    required int total,
    required int active,
    required int completed,
  }) = _OrderAnalyticsModel;

  factory OrderAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderAnalyticsModelFromJson(json);
}
