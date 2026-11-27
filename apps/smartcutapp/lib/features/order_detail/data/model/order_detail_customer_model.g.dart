// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDetailCustomerModel _$OrderDetailCustomerModelFromJson(
  Map<String, dynamic> json,
) => _OrderDetailCustomerModel(
  id: json['id'] as String,
  name: json['name'] as String,
  contactName: json['contactName'] as String?,
  contactPhone: json['contactPhone'] as String?,
  contactEmail: json['contactEmail'] as String?,
);

Map<String, dynamic> _$OrderDetailCustomerModelToJson(
  _OrderDetailCustomerModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'contactName': instance.contactName,
  'contactPhone': instance.contactPhone,
  'contactEmail': instance.contactEmail,
};
