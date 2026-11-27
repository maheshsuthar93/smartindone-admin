import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_material_model.freezed.dart';

part 'inventory_material_model.g.dart';

@freezed
abstract class InventoryMaterialModel with _$InventoryMaterialModel {
  const factory InventoryMaterialModel({
    required String id,
    required String name,
  }) = _InventoryMaterialModel;

  factory InventoryMaterialModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryMaterialModelFromJson(json);
}
