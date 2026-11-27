// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectAnalyticsModel _$ProjectAnalyticsModelFromJson(
  Map<String, dynamic> json,
) => _ProjectAnalyticsModel(
  total: (json['total'] as num).toInt(),
  active: (json['active'] as num).toInt(),
  completed: (json['completed'] as num).toInt(),
);

Map<String, dynamic> _$ProjectAnalyticsModelToJson(
  _ProjectAnalyticsModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'active': instance.active,
  'completed': instance.completed,
};
