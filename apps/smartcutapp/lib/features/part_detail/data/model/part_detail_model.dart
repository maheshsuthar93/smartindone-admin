import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_detail_model.freezed.dart';

part 'part_detail_model.g.dart';

@freezed
abstract class PartDetailModel with _$PartDetailModel {
  const factory PartDetailModel({
    required String id,
    required int partNumber,
    required String orderItemId,
    required String name,
    required double width,
    required double height,
    required double thickness,
    required bool grain,
    @Default(true) bool rotatable,
    bool? isDeleted,
    required int quantity,
    String? materialId,
    GrainDirection? grainDirection,
    double? edgeBandTop,
    double? edgeBandBottom,
    double? edgeBandLeft,
    double? edgeBandRight,
    required DateTime createdAt,
    DateTime? updatedAt,
    required MaterialModel material,
  }) = _PartDetailModel;

  factory PartDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PartDetailModelFromJson(json);
}

@freezed
abstract class MaterialModel with _$MaterialModel {
  const factory MaterialModel({
    required String id,
    required String name,
    required double thickness,
    required String type,
  }) = _MaterialModel;

  factory MaterialModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialModelFromJson(json);
}
