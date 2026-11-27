import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_package_piece_model.freezed.dart';
part 'available_package_piece_model.g.dart';

@freezed
abstract class AvailablePackagePieceModel with _$AvailablePackagePieceModel {
  const AvailablePackagePieceModel._();

  const factory AvailablePackagePieceModel({
    required String id,
    required String pieceCode,
    int? pieceNumber,
    @Default(0) num width,
    @Default(0) num height,
    @Default(0) num thickness,
    String? barcode,
    String? qrCode,
    PackagePiecePartModel? part,
  }) = _AvailablePackagePieceModel;

  factory AvailablePackagePieceModel.fromJson(Map<String, dynamic> json) =>
      _$AvailablePackagePieceModelFromJson(json);

  String get dimension => '$width × $height × $thickness';
  String get itemName => part?.orderItem?.name ?? '';
  int? get partNumber => part?.partNumber;
  String get itemLabel =>
      partNumber == null ? itemName : '$itemName · Part $partNumber';
}

@freezed
abstract class PackagePiecePartModel with _$PackagePiecePartModel {
  const factory PackagePiecePartModel({
    required String id,
    int? partNumber,
    PackagePieceOrderItemModel? orderItem,
  }) = _PackagePiecePartModel;

  factory PackagePiecePartModel.fromJson(Map<String, dynamic> json) =>
      _$PackagePiecePartModelFromJson(json);
}

@freezed
abstract class PackagePieceOrderItemModel with _$PackagePieceOrderItemModel {
  const factory PackagePieceOrderItemModel({
    required String id,
    required String name,
  }) = _PackagePieceOrderItemModel;

  factory PackagePieceOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$PackagePieceOrderItemModelFromJson(json);
}
