import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_detail_material_model.freezed.dart';

part 'part_detail_material_model.g.dart';

@freezed
abstract class PartDetailMaterialModel with _$PartDetailMaterialModel {
  const factory PartDetailMaterialModel({
    required String id,
    required String name,
    required DateTime createdAt,
  }) = _PartDetailMaterialModel;

  factory PartDetailMaterialModel.fromJson(Map<String, dynamic> json) =>
      _$PartDetailMaterialModelFromJson(json);
}
