// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderAnalyticsModel _$OrderAnalyticsModelFromJson(Map<String, dynamic> json) =>
    _OrderAnalyticsModel(
      total: (json['total'] as num).toInt(),
      active: (json['active'] as num).toInt(),
      completed: (json['completed'] as num).toInt(),
    );

Map<String, dynamic> _$OrderAnalyticsModelToJson(
  _OrderAnalyticsModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'active': instance.active,
  'completed': instance.completed,
};
