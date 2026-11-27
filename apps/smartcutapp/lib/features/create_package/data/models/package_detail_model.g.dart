// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageDetailModel _$PackageDetailModelFromJson(Map<String, dynamic> json) =>
    _PackageDetailModel(
      id: _readId(json, 'id') as String,
      name: _readName(json, 'name') as String,
      status: json['status'] as String? ?? 'PACKING',
      shipmentId: json['shipmentId'] as String?,
    );

Map<String, dynamic> _$PackageDetailModelToJson(_PackageDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'shipmentId': instance.shipmentId,
    };
