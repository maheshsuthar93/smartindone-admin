// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShipmentModel _$ShipmentModelFromJson(Map<String, dynamic> json) =>
    _ShipmentModel(
      id: json['id'] as String,
      shipmentNo: json['shipmentNo'] as String,
      orderId: json['orderId'] as String,
      driverId: json['driverId'] as String?,
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
      packages:
          (json['packages'] as List<dynamic>?)
              ?.map((e) => PackageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      order: OrderModel.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShipmentModelToJson(_ShipmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipmentNo': instance.shipmentNo,
      'orderId': instance.orderId,
      'driverId': instance.driverId,
      'status': _$ShipmentStatusEnumMap[instance.status]!,
      'dispatchDate': instance.dispatchDate?.toIso8601String(),
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'actualDeliveryDate': instance.actualDeliveryDate?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'packages': instance.packages,
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

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String,
  customer: CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
  project: ProjectModel.fromJson(json['project'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer': instance.customer,
      'project': instance.project,
    };

_CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    _CustomerModel(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$CustomerModelToJson(_CustomerModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_PackageModel _$PackageModelFromJson(Map<String, dynamic> json) =>
    _PackageModel(
      id: (json['id'] as num).toInt(),
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
