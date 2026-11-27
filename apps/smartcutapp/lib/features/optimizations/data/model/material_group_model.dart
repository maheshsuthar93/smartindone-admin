import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_group_model.freezed.dart';

part 'material_group_model.g.dart';

@freezed
abstract class MaterialGroupModel with _$MaterialGroupModel {
  const factory MaterialGroupModel({
    required String id,
    required MaterialGroupStatus status,
    required MaterialModel material,
    int? pieceCount,
  }) = _MaterialGroupModel;

  factory MaterialGroupModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialGroupModelFromJson(json);
}

@freezed
abstract class MaterialModel with _$MaterialModel {
  const factory MaterialModel({
    required String id,
    required String name,
    required String code,
    required String type,
    required int thickness,
    required String unit,
  }) = _MaterialModel;

  factory MaterialModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialModelFromJson(json);
}
