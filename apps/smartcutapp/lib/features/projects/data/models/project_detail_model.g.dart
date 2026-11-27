// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectDetailModel _$ProjectDetailModelFromJson(Map<String, dynamic> json) =>
    _ProjectDetailModel(
      id: json['id'] as String,
      name: json['name'] as String,
      status: $enumDecode(
        _$ProjectStatusEnumMap,
        json['status'],
        unknownValue: ProjectStatus.unknown,
      ),
      customerId: json['customerId'] as String,
      companyId: json['companyId'] as String,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      expectedEndDate: json['expectedEndDate'] == null
          ? null
          : DateTime.parse(json['expectedEndDate'] as String),
      actualEndDate: json['actualEndDate'] == null
          ? null
          : DateTime.parse(json['actualEndDate'] as String),
      deliveryAddress: json['deliveryAddress'] as String?,
      deliveryAddress2: json['deliveryAddress2'] as String?,
      deliveryCity: json['deliveryCity'] as String?,
      deliveryState: json['deliveryState'] as String?,
      deliveryPostalCode: json['deliveryPostalCode'] as String?,
      deliveryCountry: json['deliveryCountry'] as String?,
      contactName: json['contactName'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      customer: json['customer'] == null
          ? null
          : ProjectDetailCustomerModel.fromJson(
              json['customer'] as Map<String, dynamic>,
            ),
      ordersCount:
          (_readOrdersCount(json, 'ordersCount') as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProjectDetailModelToJson(_ProjectDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'customerId': instance.customerId,
      'companyId': instance.companyId,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'expectedEndDate': instance.expectedEndDate?.toIso8601String(),
      'actualEndDate': instance.actualEndDate?.toIso8601String(),
      'deliveryAddress': instance.deliveryAddress,
      'deliveryAddress2': instance.deliveryAddress2,
      'deliveryCity': instance.deliveryCity,
      'deliveryState': instance.deliveryState,
      'deliveryPostalCode': instance.deliveryPostalCode,
      'deliveryCountry': instance.deliveryCountry,
      'contactName': instance.contactName,
      'contactPhone': instance.contactPhone,
      'contactEmail': instance.contactEmail,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'customer': instance.customer,
      'ordersCount': instance.ordersCount,
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.planning: 'PLANNING',
  ProjectStatus.inProgress: 'IN_PROGRESS',
  ProjectStatus.onHold: 'ON_HOLD',
  ProjectStatus.completed: 'COMPLETED',
  ProjectStatus.cancelled: 'CANCELLED',
  ProjectStatus.unknown: 'UNKNOWN',
};

_ProjectDetailCustomerModel _$ProjectDetailCustomerModelFromJson(
  Map<String, dynamic> json,
) => _ProjectDetailCustomerModel(
  id: json['id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$ProjectDetailCustomerModelToJson(
  _ProjectDetailCustomerModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
};
