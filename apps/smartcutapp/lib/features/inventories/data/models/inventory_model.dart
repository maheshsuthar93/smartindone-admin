import 'package:board_cut/features/inventories/data/models/inventory_material_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'inventory_hardware_model.dart';

part 'inventory_model.freezed.dart';

part 'inventory_model.g.dart';

@freezed
abstract class InventoryModel with _$InventoryModel {
  const factory InventoryModel({
    required String id,
    String? materialId,
    String? hardwareId,
    required int available,
    required int onHand,
    required int reserved,
    required WarehouseModel warehouse,
    InventoryMaterialModel? material,
    InventoryHardwareModel? hardware,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _InventoryModel;

  factory InventoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryModelFromJson(json);
}

@freezed
abstract class WarehouseModel with _$WarehouseModel {
  const factory WarehouseModel({
    required String id,
    required String name,
    required FactoryModel factory,
  }) = _WarehouseModel;

  factory WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseModelFromJson(json);
}

@freezed
abstract class FactoryModel with _$FactoryModel {
  const factory FactoryModel({required String id, required String name}) =
      _FactoryModel;

  factory FactoryModel.fromJson(Map<String, dynamic> json) =>
      _$FactoryModelFromJson(json);
}
