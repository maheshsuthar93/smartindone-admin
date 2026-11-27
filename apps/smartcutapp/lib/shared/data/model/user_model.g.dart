// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  companyId: json['companyId'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String?,
  company: json['company'] == null
      ? null
      : CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
  status: $enumDecode(_$UserStatusEnumMap, json['status']),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': _$UserRoleEnumMap[instance.role]!,
      'companyId': instance.companyId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'company': instance.company,
      'status': _$UserStatusEnumMap[instance.status]!,
    };

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'SUPER_ADMIN',
  UserRole.admin: 'ADMIN',
  UserRole.manager: 'MANAGER',
  UserRole.operator: 'OPERATOR',
  UserRole.sales: 'SALES',
};

const _$UserStatusEnumMap = {
  UserStatus.active: 'ACTIVE',
  UserStatus.inActive: 'INACTIVE',
  UserStatus.suspended: 'SUSPENDED',
};
