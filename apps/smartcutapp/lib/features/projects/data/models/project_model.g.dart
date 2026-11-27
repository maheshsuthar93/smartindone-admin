// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    _ProjectModel(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      companyId: json['companyId'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String?,
      contactName: json['contactName'] as String?,
      contactEmail: json['contactEmail'] as String?,
      contactPhone: json['contactPhone'] as String?,
      status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      expectedEndDate: json['expectedEndDate'] == null
          ? null
          : DateTime.parse(json['expectedEndDate'] as String),
      actualEndDate: json['actualEndDate'] == null
          ? null
          : DateTime.parse(json['actualEndDate'] as String),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'companyId': instance.companyId,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'description': instance.description,
      'contactName': instance.contactName,
      'contactEmail': instance.contactEmail,
      'contactPhone': instance.contactPhone,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'startDate': instance.startDate?.toIso8601String(),
      'expectedEndDate': instance.expectedEndDate?.toIso8601String(),
      'actualEndDate': instance.actualEndDate?.toIso8601String(),
      'isActive': instance.isActive,
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.planning: 'PLANNING',
  ProjectStatus.inProgress: 'IN_PROGRESS',
  ProjectStatus.onHold: 'ON_HOLD',
  ProjectStatus.completed: 'COMPLETED',
  ProjectStatus.cancelled: 'CANCELLED',
  ProjectStatus.unknown: 'UNKNOWN',
};
