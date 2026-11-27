// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemDetailModel _$ItemDetailModelFromJson(Map<String, dynamic> json) =>
    _ItemDetailModel(
      id: json['id'] as String,
      orderId: json['orderId'] as String,
      name: json['name'] as String,
      overallWidth: (json['overallWidth'] as num).toDouble(),
      overallHeight: (json['overallHeight'] as num).toDouble(),
      overallDepth: (json['overallDepth'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      progress: json['progress'] == null
          ? null
          : ProgressModel.fromJson(json['progress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemDetailModelToJson(_ItemDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'name': instance.name,
      'overallWidth': instance.overallWidth,
      'overallHeight': instance.overallHeight,
      'overallDepth': instance.overallDepth,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt.toIso8601String(),
      'progress': instance.progress,
    };

_ProgressModel _$ProgressModelFromJson(Map<String, dynamic> json) =>
    _ProgressModel(
      status: $enumDecode(_$ItemStatusEnumMap, json['status']),
      totalPieces: (json['totalPieces'] as num).toInt(),
      completedPieces: (json['completedPieces'] as num).toInt(),
      pendingPieces: (json['pendingPieces'] as num).toInt(),
      progressPercent: (json['progressPercent'] as num).toDouble(),
      stages: (json['stages'] as List<dynamic>?)
          ?.map((e) => StagesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProgressModelToJson(_ProgressModel instance) =>
    <String, dynamic>{
      'status': _$ItemStatusEnumMap[instance.status]!,
      'totalPieces': instance.totalPieces,
      'completedPieces': instance.completedPieces,
      'pendingPieces': instance.pendingPieces,
      'progressPercent': instance.progressPercent,
      'stages': instance.stages,
    };

const _$ItemStatusEnumMap = {
  ItemStatus.pending: 'PENDING',
  ItemStatus.inProgress: 'IN_PROGRESS',
  ItemStatus.completed: 'COMPLETED',
  ItemStatus.unknown: 'UNKNOWN',
};

_StagesModel _$StagesModelFromJson(Map<String, dynamic> json) => _StagesModel(
  name: json['name'] as String,
  total: (json['total'] as num).toInt(),
  completed: (json['completed'] as num).toInt(),
  progressPercent: (json['progressPercent'] as num).toDouble(),
);

Map<String, dynamic> _$StagesModelToJson(_StagesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'total': instance.total,
      'completed': instance.completed,
      'progressPercent': instance.progressPercent,
    };
