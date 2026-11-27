import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_hardware_model.freezed.dart';

part 'inventory_hardware_model.g.dart';

@freezed
abstract class InventoryHardwareModel with _$InventoryHardwareModel {
  const factory InventoryHardwareModel({
    required String id,
    required String name,
  }) = _InventoryHardwareModel;

  factory InventoryHardwareModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryHardwareModelFromJson(json);
}
