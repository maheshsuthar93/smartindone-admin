// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => _DriverModel(
  id: json['id'] as String,
  companyId: json['companyId'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  licenseNo: json['licenseNo'] as String,
  vehicleNumber: json['vehicleNumber'] as String,
  vehicleType: json['vehicleType'] as String,
  status: json['status'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$DriverModelToJson(_DriverModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'licenseNo': instance.licenseNo,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleType': instance.vehicleType,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
