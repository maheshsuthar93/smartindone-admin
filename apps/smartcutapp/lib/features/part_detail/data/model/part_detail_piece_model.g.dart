// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_detail_piece_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartDetailPieceModel _$PartDetailPieceModelFromJson(
  Map<String, dynamic> json,
) => _PartDetailPieceModel(
  id: json['id'] as String,
  partId: json['partId'] as String,
  pieceCode: json['pieceCode'] as String,
  serialNo: json['serialNo'] as String?,
  width: (json['width'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  thickness: (json['thickness'] as num).toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PartDetailPieceModelToJson(
  _PartDetailPieceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'partId': instance.partId,
  'pieceCode': instance.pieceCode,
  'serialNo': instance.serialNo,
  'width': instance.width,
  'height': instance.height,
  'thickness': instance.thickness,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
