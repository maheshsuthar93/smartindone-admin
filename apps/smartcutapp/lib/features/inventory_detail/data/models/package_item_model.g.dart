// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageItemModel _$PackageItemModelFromJson(Map<String, dynamic> json) =>
    _PackageItemModel(
      id: json['id'] as String,
      packageId: json['packageId'] as String,
      pieceId: json['pieceId'] as String,
      piece: json['piece'] == null
          ? null
          : PieceModel.fromJson(json['piece'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PackageItemModelToJson(_PackageItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'packageId': instance.packageId,
      'pieceId': instance.pieceId,
      'piece': instance.piece,
    };
