// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'optimization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OptimizationModel _$OptimizationModelFromJson(Map<String, dynamic> json) =>
    _OptimizationModel(
      id: json['id'] as String,
      optimizationNo: json['optimizationNo'] as String,
      status: $enumDecode(_$OptimizationStatusEnumMap, json['status']),
      kerf: (json['kerf'] as num?)?.toDouble(),
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
    );

Map<String, dynamic> _$OptimizationModelToJson(_OptimizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'optimizationNo': instance.optimizationNo,
      'status': _$OptimizationStatusEnumMap[instance.status]!,
      'kerf': instance.kerf,
      'contactPhone': instance.contactPhone,
      'contactEmail': instance.contactEmail,
    };

const _$OptimizationStatusEnumMap = {
  OptimizationStatus.draft: 'DRAFT',
  OptimizationStatus.inProgress: 'IN_PROGRESS',
  OptimizationStatus.completed: 'COMPLETED',
  OptimizationStatus.cancelled: 'CANCELLED',
  OptimizationStatus.unknown: 'UNKNOWN',
};
