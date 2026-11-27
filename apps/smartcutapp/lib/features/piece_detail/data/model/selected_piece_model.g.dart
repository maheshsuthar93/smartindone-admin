// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_piece_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SelectedPieceModel _$SelectedPieceModelFromJson(Map<String, dynamic> json) =>
    _SelectedPieceModel(
      id: json['id'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      pieceCode: json['pieceCode'] as String?,
      partName: json['partName'] as String?,
      materialName: json['materialName'] as String?,
      orderCode: json['orderCode'] as String?,
      edgeBandTop: (json['edgeBandTop'] as num?)?.toDouble(),
      edgeBandBottom: (json['edgeBandBottom'] as num?)?.toDouble(),
      edgeBandLeft: (json['edgeBandLeft'] as num?)?.toDouble(),
      edgeBandRight: (json['edgeBandRight'] as num?)?.toDouble(),
      thickness: (json['thickness'] as num).toInt(),
      part: PieceRules.fromJson(json['part'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      processes: (json['processes'] as List<dynamic>)
          .map((e) => PieceProcess.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SelectedPieceModelToJson(_SelectedPieceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'pieceCode': instance.pieceCode,
      'partName': instance.partName,
      'materialName': instance.materialName,
      'orderCode': instance.orderCode,
      'edgeBandTop': instance.edgeBandTop,
      'edgeBandBottom': instance.edgeBandBottom,
      'edgeBandLeft': instance.edgeBandLeft,
      'edgeBandRight': instance.edgeBandRight,
      'thickness': instance.thickness,
      'part': instance.part,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'processes': instance.processes,
    };

_PieceRules _$PieceRulesFromJson(Map<String, dynamic> json) => _PieceRules(
  grain: json['grain'] as bool,
  grainDirection: $enumDecode(_$GrainDirectionEnumMap, json['grainDirection']),
  rotatable: json['rotatable'] as bool,
);

Map<String, dynamic> _$PieceRulesToJson(_PieceRules instance) =>
    <String, dynamic>{
      'grain': instance.grain,
      'grainDirection': _$GrainDirectionEnumMap[instance.grainDirection]!,
      'rotatable': instance.rotatable,
    };

const _$GrainDirectionEnumMap = {
  GrainDirection.length: 'LENGTH',
  GrainDirection.width: 'WIDTH',
  GrainDirection.none: 'NONE',
};

_PieceProcess _$PieceProcessFromJson(Map<String, dynamic> json) =>
    _PieceProcess(
      id: json['id'] as String?,
      processType: ProcessType.fromJson(
        json['processType'] as Map<String, dynamic>,
      ),
      status: $enumDecode(_$ProcessStatusEnumMap, json['status']),
      remarks: json['remarks'] as String?,
      machineId: json['machineId'] as String?,
      operatorId: json['operatorId'] as String?,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$PieceProcessToJson(_PieceProcess instance) =>
    <String, dynamic>{
      'id': instance.id,
      'processType': instance.processType,
      'status': _$ProcessStatusEnumMap[instance.status]!,
      'remarks': instance.remarks,
      'machineId': instance.machineId,
      'operatorId': instance.operatorId,
      'startedAt': instance.startedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
    };

const _$ProcessStatusEnumMap = {
  ProcessStatus.pending: 'PENDING',
  ProcessStatus.inProgress: 'IN_PROGRESS',
  ProcessStatus.completed: 'COMPLETED',
  ProcessStatus.failed: 'FAILED',
};

_ProcessType _$ProcessTypeFromJson(Map<String, dynamic> json) => _ProcessType(
  id: json['id'] as String,
  name: json['name'] as String,
  sequenceOrder: (json['sequenceOrder'] as num).toInt(),
);

Map<String, dynamic> _$ProcessTypeToJson(_ProcessType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sequenceOrder': instance.sequenceOrder,
    };
