// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'optimization_material_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OptimizationMaterialGroupModel _$OptimizationMaterialGroupModelFromJson(
  Map<String, dynamic> json,
) => _OptimizationMaterialGroupModel(
  id: json['id'] as String,
  optimizationId: json['optimizationId'] as String,
  materialId: json['materialId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  status: json['status'] as String,
  optimization: Optimization.fromJson(
    json['optimization'] as Map<String, dynamic>,
  ),
  material: MaterialModel.fromJson(json['material'] as Map<String, dynamic>),
  pieces: (json['pieces'] as List<dynamic>)
      .map((e) => OptimizationPiece.fromJson(e as Map<String, dynamic>))
      .toList(),
  layouts: (json['layouts'] as List<dynamic>)
      .map((e) => OptimizationLayoutModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OptimizationMaterialGroupModelToJson(
  _OptimizationMaterialGroupModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'optimizationId': instance.optimizationId,
  'materialId': instance.materialId,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'status': instance.status,
  'optimization': instance.optimization,
  'material': instance.material,
  'pieces': instance.pieces,
  'layouts': instance.layouts,
};

_Optimization _$OptimizationFromJson(Map<String, dynamic> json) =>
    _Optimization(
      id: json['id'] as String,
      optimizationNo: json['optimizationNo'] as String,
      orderId: json['orderId'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$OptimizationToJson(_Optimization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'optimizationNo': instance.optimizationNo,
      'orderId': instance.orderId,
      'status': instance.status,
    };

_MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) =>
    _MaterialModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      type: $enumDecode(_$MaterialTypeEnumMap, json['type']),
      thickness: (json['thickness'] as num).toInt(),
      density: (json['density'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      defaultHeight: (json['defaultHeight'] as num?)?.toDouble(),
      defaultLength: (json['defaultLength'] as num?)?.toDouble(),
      defaultWidth: (json['defaultWidth'] as num?)?.toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$MaterialModelToJson(_MaterialModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': _$MaterialTypeEnumMap[instance.type]!,
      'thickness': instance.thickness,
      'density': instance.density,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'defaultHeight': instance.defaultHeight,
      'defaultLength': instance.defaultLength,
      'defaultWidth': instance.defaultWidth,
      'unit': instance.unit,
    };

const _$MaterialTypeEnumMap = {
  MaterialType.mdf: 'MDF',
  MaterialType.hdhmr: 'HDHMR',
  MaterialType.plywood: 'PLYWOOD',
  MaterialType.particleBoard: 'PARTICLE_BOARD',
  MaterialType.laminate: 'LAMINATE',
  MaterialType.acrylic: 'ACRYLIC',
  MaterialType.aluminium: 'ALUMINIUM',
  MaterialType.other: 'OTHER',
  MaterialType.consumable: 'CONSUMABLE',
  MaterialType.unknown: 'UNKNOWN',
};

_Part _$PartFromJson(Map<String, dynamic> json) => _Part(
  id: json['id'] as String,
  name: json['name'] as String,
  materialId: json['materialId'] as String,
  grain: json['grain'] as bool,
  grainDirection: $enumDecode(_$GrainDirectionEnumMap, json['grainDirection']),
  rotatable: json['rotatable'] as bool,
);

Map<String, dynamic> _$PartToJson(_Part instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'materialId': instance.materialId,
  'grain': instance.grain,
  'grainDirection': _$GrainDirectionEnumMap[instance.grainDirection]!,
  'rotatable': instance.rotatable,
};

const _$GrainDirectionEnumMap = {
  GrainDirection.length: 'LENGTH',
  GrainDirection.width: 'WIDTH',
  GrainDirection.none: 'NONE',
};

_Piece2 _$Piece2FromJson(Map<String, dynamic> json) => _Piece2(
  id: json['id'] as String,
  pieceCode: json['pieceCode'] as String,
  serialNo: json['serialNo'] as String?,
  width: (json['width'] as num).toInt(),
  height: (json['height'] as num).toInt(),
  thickness: (json['thickness'] as num).toInt(),
  isDeleted: json['isDeleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  partId: json['partId'] as String,
  barcode: json['barcode'] as String?,
  qrCode: json['qrCode'] as String?,
  edgeBandTop: (json['edgeBandTop'] as num?)?.toInt(),
  edgeBandBottom: (json['edgeBandBottom'] as num?)?.toInt(),
  edgeBandLeft: (json['edgeBandLeft'] as num?)?.toInt(),
  edgeBandRight: (json['edgeBandRight'] as num?)?.toInt(),
  pieceProcesses:
      (json['pieceProcesses'] as List<dynamic>?)
          ?.map(
            (e) => OptimizationPieceProcess.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  part: json['part'] == null
      ? null
      : Part.fromJson(json['part'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Piece2ToJson(_Piece2 instance) => <String, dynamic>{
  'id': instance.id,
  'pieceCode': instance.pieceCode,
  'serialNo': instance.serialNo,
  'width': instance.width,
  'height': instance.height,
  'thickness': instance.thickness,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'partId': instance.partId,
  'barcode': instance.barcode,
  'qrCode': instance.qrCode,
  'edgeBandTop': instance.edgeBandTop,
  'edgeBandBottom': instance.edgeBandBottom,
  'edgeBandLeft': instance.edgeBandLeft,
  'edgeBandRight': instance.edgeBandRight,
  'pieceProcesses': instance.pieceProcesses,
  'part': instance.part,
};

_OptimizationPieceProcess _$OptimizationPieceProcessFromJson(
  Map<String, dynamic> json,
) => _OptimizationPieceProcess(
  processTypeId: json['processTypeId'] as String,
  status: $enumDecode(_$ProcessStatusEnumMap, json['status']),
);

Map<String, dynamic> _$OptimizationPieceProcessToJson(
  _OptimizationPieceProcess instance,
) => <String, dynamic>{
  'processTypeId': instance.processTypeId,
  'status': _$ProcessStatusEnumMap[instance.status]!,
};

const _$ProcessStatusEnumMap = {
  ProcessStatus.pending: 'PENDING',
  ProcessStatus.inProgress: 'IN_PROGRESS',
  ProcessStatus.completed: 'COMPLETED',
  ProcessStatus.failed: 'FAILED',
};

_OptimizationProcessType _$OptimizationProcessTypeFromJson(
  Map<String, dynamic> json,
) => _OptimizationProcessType(
  id: json['id'] as String,
  name: json['name'] as String,
  sequenceOrder: (json['sequenceOrder'] as num).toInt(),
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$OptimizationProcessTypeToJson(
  _OptimizationProcessType instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'sequenceOrder': instance.sequenceOrder,
  'isActive': instance.isActive,
};

_OptimizationPiece _$OptimizationPieceFromJson(Map<String, dynamic> json) =>
    _OptimizationPiece(
      id: json['id'] as String,
      materialGroupId: json['materialGroupId'] as String,
      pieceId: json['pieceId'] as String,
      piece: Piece2.fromJson(json['piece'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OptimizationPieceToJson(_OptimizationPiece instance) =>
    <String, dynamic>{
      'id': instance.id,
      'materialGroupId': instance.materialGroupId,
      'pieceId': instance.pieceId,
      'piece': instance.piece,
    };

_LayoutItem _$LayoutItemFromJson(Map<String, dynamic> json) => _LayoutItem(
  id: json['id'] as String,
  optimizationSheetId: json['optimizationSheetId'] as String,
  optimizationPieceId: json['optimizationPieceId'] as String,
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  rotated: json['rotated'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  optimizationPiece: OptimizationPiece.fromJson(
    json['optimizationPiece'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$LayoutItemToJson(_LayoutItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'optimizationSheetId': instance.optimizationSheetId,
      'optimizationPieceId': instance.optimizationPieceId,
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
      'rotated': instance.rotated,
      'createdAt': instance.createdAt.toIso8601String(),
      'optimizationPiece': instance.optimizationPiece,
    };

_OptimizationSheetModel _$OptimizationSheetModelFromJson(
  Map<String, dynamic> json,
) => _OptimizationSheetModel(
  id: json['id'] as String,
  layoutId: json['layoutId'] as String,
  sheetId: json['sheetId'] as String?,
  sheetNo: (json['sheetNo'] as num).toInt(),
  width: (json['width'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  sheet: json['sheet'] == null
      ? null
      : PhysicalSheetOrientation.fromJson(
          json['sheet'] as Map<String, dynamic>,
        ),
  utilizationPercent: (json['utilizationPercent'] as num?)?.toDouble(),
  wasteArea: (json['wasteArea'] as num?)?.toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  layoutItems: (json['layoutItems'] as List<dynamic>)
      .map((e) => LayoutItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  remainingAreas:
      (json['remainingAreas'] as List<dynamic>?)
          ?.map((e) => RemainingArea.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OptimizationSheetModelToJson(
  _OptimizationSheetModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'layoutId': instance.layoutId,
  'sheetId': instance.sheetId,
  'sheetNo': instance.sheetNo,
  'width': instance.width,
  'height': instance.height,
  'sheet': instance.sheet,
  'utilizationPercent': instance.utilizationPercent,
  'wasteArea': instance.wasteArea,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'layoutItems': instance.layoutItems,
  'remainingAreas': instance.remainingAreas,
};

_PhysicalSheetOrientation _$PhysicalSheetOrientationFromJson(
  Map<String, dynamic> json,
) => _PhysicalSheetOrientation(
  id: json['id'] as String,
  width: (json['width'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  grainDirection: $enumDecode(_$GrainDirectionEnumMap, json['grainDirection']),
);

Map<String, dynamic> _$PhysicalSheetOrientationToJson(
  _PhysicalSheetOrientation instance,
) => <String, dynamic>{
  'id': instance.id,
  'width': instance.width,
  'height': instance.height,
  'grainDirection': _$GrainDirectionEnumMap[instance.grainDirection]!,
};

_OptimizationLayoutModel _$OptimizationLayoutModelFromJson(
  Map<String, dynamic> json,
) => _OptimizationLayoutModel(
  id: json['id'] as String,
  layoutNo: json['layoutNo'] as String?,
  materialGroupId: json['materialGroupId'] as String,
  status: $enumDecode(_$LayoutStatusEnumMap, json['status']),
  efficiencyPercent: json['efficiencyPercent'] as String?,
  totalWasteArea: json['totalWasteArea'] as String?,
  totalSheetArea: json['totalSheetArea'] as String?,
  sheetCount: (json['sheetCount'] as num).toInt(),
  algorithmVersion: json['algorithmVersion'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  sheets: (json['sheets'] as List<dynamic>)
      .map((e) => OptimizationSheetModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OptimizationLayoutModelToJson(
  _OptimizationLayoutModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'layoutNo': instance.layoutNo,
  'materialGroupId': instance.materialGroupId,
  'status': _$LayoutStatusEnumMap[instance.status]!,
  'efficiencyPercent': instance.efficiencyPercent,
  'totalWasteArea': instance.totalWasteArea,
  'totalSheetArea': instance.totalSheetArea,
  'sheetCount': instance.sheetCount,
  'algorithmVersion': instance.algorithmVersion,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'sheets': instance.sheets,
};

const _$LayoutStatusEnumMap = {
  LayoutStatus.generated: 'GENERATED',
  LayoutStatus.selected: 'SELECTED',
  LayoutStatus.inProduction: 'IN_PRODUCTION',
  LayoutStatus.completed: 'COMPLETED',
  LayoutStatus.cancelled: 'CANCELLED',
  LayoutStatus.unknown: 'UNKNOWN',
};

_RemainingArea _$RemainingAreaFromJson(Map<String, dynamic> json) =>
    _RemainingArea(
      id: json['id'] as String,
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      status: $enumDecode(_$RemainingAreaStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$RemainingAreaToJson(_RemainingArea instance) =>
    <String, dynamic>{
      'id': instance.id,
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
      'status': _$RemainingAreaStatusEnumMap[instance.status]!,
    };

const _$RemainingAreaStatusEnumMap = {
  RemainingAreaStatus.pending: 'PENDING',
  RemainingAreaStatus.offcut: 'OFFCUT',
  RemainingAreaStatus.scrap: 'SCRAP',
};
