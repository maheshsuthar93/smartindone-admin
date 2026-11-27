// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProcessTypeModel _$ProcessTypeModelFromJson(Map<String, dynamic> json) =>
    _ProcessTypeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      sequenceOrder: (json['sequenceOrder'] as num).toInt(),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$ProcessTypeModelToJson(_ProcessTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sequenceOrder': instance.sequenceOrder,
      'isActive': instance.isActive,
    };
