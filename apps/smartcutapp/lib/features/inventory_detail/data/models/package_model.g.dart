// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageModel _$PackageModelFromJson(Map<String, dynamic> json) =>
    _PackageModel(
      id: (json['id'] as num).toInt(),
      shipmentId: json['shipmentId'] as String,
      packageNo: json['packageNo'] as String,
      weight: (json['weight'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      status: $enumDecode(_$PackageStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => PackageItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PackageModelToJson(_PackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipmentId': instance.shipmentId,
      'packageNo': instance.packageNo,
      'weight': instance.weight,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'status': _$PackageStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'items': instance.items,
    };

const _$PackageStatusEnumMap = {
  PackageStatus.packing: 'ADMIN',
  PackageStatus.packed: 'PACKED',
  PackageStatus.loaded: 'LOADED',
  PackageStatus.unknown: 'UNKNOWN',
};
