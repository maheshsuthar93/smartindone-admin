// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_detail_material_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartDetailMaterialModel _$PartDetailMaterialModelFromJson(
  Map<String, dynamic> json,
) => _PartDetailMaterialModel(
  id: json['id'] as String,
  name: json['name'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$PartDetailMaterialModelToJson(
  _PartDetailMaterialModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'createdAt': instance.createdAt.toIso8601String(),
};
