// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShipmentDetailModel _$ShipmentDetailModelFromJson(Map<String, dynamic> json) =>
    _ShipmentDetailModel(
      id: json['id'] as String,
      shipmentNo: json['shipmentNo'] as String,
      orderId: json['orderId'] as String,
      driverId: json['driverId'] as String?,
      deliveryAddress: json['deliveryAddress'] as String?,
      deliveryAddress2: json['deliveryAddress2'] as String?,
      deliveryCity: json['deliveryCity'] as String?,
      deliveryState: json['deliveryState'] as String?,
      deliveryPostalCode: json['deliveryPostalCode'] as String?,
      deliveryCountry: json['deliveryCountry'] as String?,
      deliveryInstructions: json['deliveryInstructions'] as String?,
      status: $enumDecode(_$ShipmentStatusEnumMap, json['status']),
      dispatchDate: json['dispatchDate'] == null
          ? null
          : DateTime.parse(json['dispatchDate'] as String),
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String),
      actualDeliveryDate: json['actualDeliveryDate'] == null
          ? null
          : DateTime.parse(json['actualDeliveryDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      driver: json['driver'] == null
          ? null
          : DriverModel.fromJson(json['driver'] as Map<String, dynamic>),
      order: OrderModel.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipmentDetailModelToJson(
  _ShipmentDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'shipmentNo': instance.shipmentNo,
  'orderId': instance.orderId,
  'driverId': instance.driverId,
  'deliveryAddress': instance.deliveryAddress,
  'deliveryAddress2': instance.deliveryAddress2,
  'deliveryCity': instance.deliveryCity,
  'deliveryState': instance.deliveryState,
  'deliveryPostalCode': instance.deliveryPostalCode,
  'deliveryCountry': instance.deliveryCountry,
  'deliveryInstructions': instance.deliveryInstructions,
  'status': _$ShipmentStatusEnumMap[instance.status]!,
  'dispatchDate': instance.dispatchDate?.toIso8601String(),
  'deliveryDate': instance.deliveryDate?.toIso8601String(),
  'actualDeliveryDate': instance.actualDeliveryDate?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'driver': instance.driver,
  'order': instance.order,
};

const _$ShipmentStatusEnumMap = {
  ShipmentStatus.pending: 'PENDING',
  ShipmentStatus.dispatched: 'DISPATCHED',
  ShipmentStatus.inTransit: 'IN_TRANSIT',
  ShipmentStatus.delivered: 'DELIVERED',
  ShipmentStatus.cancelled: 'CANCELLED',
  ShipmentStatus.unknown: 'UNKNOWN',
};

_DriverModel _$DriverModelFromJson(Map<String, dynamic> json) => _DriverModel(
  name: json['name'] as String,
  phone: json['phone'] as String,
  vehicleNumber: json['vehicleNumber'] as String,
);

Map<String, dynamic> _$DriverModelToJson(_DriverModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'vehicleNumber': instance.vehicleNumber,
    };

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String,
  orderNumber: (json['orderNumber'] as num?)?.toInt(),
  orderCode: json['orderCode'] as String?,
  customer: CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
  project: ProjectModel.fromJson(json['project'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderNumber': instance.orderNumber,
      'orderCode': instance.orderCode,
      'customer': instance.customer,
      'project': instance.project,
    };

_CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    _CustomerModel(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$CustomerModelToJson(_CustomerModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_PackageModel _$PackageModelFromJson(Map<String, dynamic> json) =>
    _PackageModel(
      id: json['id'] as String,
      packageNumber: json['packageNumber'] as String,
      weight: (json['weight'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PackageModelToJson(_PackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'packageNumber': instance.packageNumber,
      'weight': instance.weight,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
    };

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    _ProjectModel(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
