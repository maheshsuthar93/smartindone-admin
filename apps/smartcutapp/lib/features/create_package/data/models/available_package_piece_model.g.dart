// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_package_piece_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvailablePackagePieceModel _$AvailablePackagePieceModelFromJson(
  Map<String, dynamic> json,
) => _AvailablePackagePieceModel(
  id: json['id'] as String,
  pieceCode: json['pieceCode'] as String,
  status: json['status'] as String? ?? 'PENDING',
  pieceNumber: (json['pieceNumber'] as num?)?.toInt(),
  width: json['width'] as num? ?? 0,
  height: json['height'] as num? ?? 0,
  thickness: json['thickness'] as num? ?? 0,
  barcode: json['barcode'] as String?,
  qrCode: json['qrCode'] as String?,
  part: json['part'] == null
      ? null
      : PackagePiecePartModel.fromJson(json['part'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AvailablePackagePieceModelToJson(
  _AvailablePackagePieceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'pieceCode': instance.pieceCode,
  'status': instance.status,
  'pieceNumber': instance.pieceNumber,
  'width': instance.width,
  'height': instance.height,
  'thickness': instance.thickness,
  'barcode': instance.barcode,
  'qrCode': instance.qrCode,
  'part': instance.part,
};

_PackagePiecePartModel _$PackagePiecePartModelFromJson(
  Map<String, dynamic> json,
) => _PackagePiecePartModel(
  id: json['id'] as String,
  partNumber: (json['partNumber'] as num?)?.toInt(),
  orderItem: json['orderItem'] == null
      ? null
      : PackagePieceOrderItemModel.fromJson(
          json['orderItem'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PackagePiecePartModelToJson(
  _PackagePiecePartModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'partNumber': instance.partNumber,
  'orderItem': instance.orderItem,
};

_PackagePieceOrderItemModel _$PackagePieceOrderItemModelFromJson(
  Map<String, dynamic> json,
) => _PackagePieceOrderItemModel(
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$PackagePieceOrderItemModelToJson(
  _PackagePieceOrderItemModel instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};
