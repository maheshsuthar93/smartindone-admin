import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_model.freezed.dart';

part 'part_model.g.dart';

@freezed
abstract class PartModel with _$PartModel {
  const factory PartModel({
    required String id,
    required String orderItemId,
    required String name,
    required double width,
    required double height,
    required double thickness,
    required bool grain,
    required int quantity,
    required GrainDirection grainDirection,
    String? materialId,
    required DateTime createdAt,
    required MaterialModel material,
  }) = _PartModel;

  factory PartModel.fromJson(Map<String, dynamic> json) =>
      _$PartModelFromJson(json);
}

@freezed
abstract class MaterialModel with _$MaterialModel {
  const factory MaterialModel({
    required String name,
    required String code,
    required MaterialType type,
  }) = _MaterialModel;

  factory MaterialModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialModelFromJson(json);
}
