import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_analytics_model.freezed.dart';

part 'customer_analytics_model.g.dart';

@freezed
abstract class CustomerAnalyticsModel with _$CustomerAnalyticsModel {
  const factory CustomerAnalyticsModel({
    required int total,
    required int active,
    required int inActive,
  }) = _CustomerAnalyticsModel;

  factory CustomerAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerAnalyticsModelFromJson(json);
}
