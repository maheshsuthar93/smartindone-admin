import 'package:board_cut/shared/shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_item_model.freezed.dart';

part 'package_item_model.g.dart';

@freezed
abstract class PackageItemModel with _$PackageItemModel {
  const factory PackageItemModel({
    required String id,
    required String packageId,
    required String pieceId,
    PieceModel? piece,
  }) = _PackageItemModel;

  factory PackageItemModel.fromJson(Map<String, dynamic> json) =>
      _$PackageItemModelFromJson(json);
}
