// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piece_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PieceModel _$PieceModelFromJson(Map<String, dynamic> json) => _PieceModel(
  id: json['id'] as String,
  pieceCode: json['pieceCode'] as String,
  width: (json['width'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  thickness: (json['thickness'] as num).toDouble(),
  cuttingStatus: $enumDecode(_$ProductionStatusEnumMap, json['cuttingStatus']),
  qcStatus: $enumDecode(_$ProductionStatusEnumMap, json['qcStatus']),
  packingStatus: $enumDecode(_$PackingStatusEnumMap, json['packingStatus']),
);

Map<String, dynamic> _$PieceModelToJson(_PieceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pieceCode': instance.pieceCode,
      'width': instance.width,
      'height': instance.height,
      'thickness': instance.thickness,
      'cuttingStatus': _$ProductionStatusEnumMap[instance.cuttingStatus]!,
      'qcStatus': _$ProductionStatusEnumMap[instance.qcStatus]!,
      'packingStatus': _$PackingStatusEnumMap[instance.packingStatus]!,
    };

const _$ProductionStatusEnumMap = {
  ProductionStatus.pending: 'PENDING',
  ProductionStatus.inProgress: 'IN_PROGRESS',
  ProductionStatus.done: 'DONE',
  ProductionStatus.rejected: 'REJECTED',
  ProductionStatus.unknown: 'UNKNOWN',
};

const _$PackingStatusEnumMap = {
  PackingStatus.notPacked: 'ADMIN',
  PackingStatus.packed: 'PACKED',
  PackingStatus.shipped: 'SHIPPED',
  PackingStatus.unknown: 'UNKNOWN',
};
