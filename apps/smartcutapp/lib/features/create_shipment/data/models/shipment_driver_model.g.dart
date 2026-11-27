// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_driver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShipmentDriverModel _$ShipmentDriverModelFromJson(Map<String, dynamic> json) =>
    _ShipmentDriverModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      vehicleNumber: json['vehicleNumber'] as String,
      licenseNo: json['licenseNo'] as String,
      vehicleType: json['vehicleType'] as String,
    );

Map<String, dynamic> _$ShipmentDriverModelToJson(
  _ShipmentDriverModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'vehicleNumber': instance.vehicleNumber,
  'licenseNo': instance.licenseNo,
  'vehicleType': instance.vehicleType,
};
