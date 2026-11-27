// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerAnalyticsModel _$CustomerAnalyticsModelFromJson(
  Map<String, dynamic> json,
) => _CustomerAnalyticsModel(
  total: (json['total'] as num).toInt(),
  active: (json['active'] as num).toInt(),
  inActive: (json['inActive'] as num).toInt(),
);

Map<String, dynamic> _$CustomerAnalyticsModelToJson(
  _CustomerAnalyticsModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'active': instance.active,
  'inActive': instance.inActive,
};
