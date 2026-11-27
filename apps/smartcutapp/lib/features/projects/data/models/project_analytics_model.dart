import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_analytics_model.freezed.dart';

part 'project_analytics_model.g.dart';

@freezed
abstract class ProjectAnalyticsModel with _$ProjectAnalyticsModel {
  const factory ProjectAnalyticsModel({
    required int total,
    required int active,
    required int completed,
  }) = _ProjectAnalyticsModel;

  factory ProjectAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectAnalyticsModelFromJson(json);
}
