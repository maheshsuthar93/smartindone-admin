import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_transaction_model.freezed.dart';
part 'inventory_transaction_model.g.dart';

@freezed
abstract class InventoryTransactionModel with _$InventoryTransactionModel {
  const factory InventoryTransactionModel({
    required String id,
    String? materialId,
    String? hardwareId,
    required String warehouseId,
    required double quantityChange,
    required String transactionType,
    String? notes,
    String? referenceType,
    String? referenceId,
    DateTime? createdAt,
    TransactionItemModel? material,
    TransactionItemModel? hardware,
    TransactionWarehouseModel? warehouse,
  }) = _InventoryTransactionModel;

  factory InventoryTransactionModel.fromJson(Map<String, dynamic> json) => _$InventoryTransactionModelFromJson(json);
}

@freezed
abstract class TransactionItemModel with _$TransactionItemModel {
  const factory TransactionItemModel({required String id, required String name, String? code, String? unit}) = _TransactionItemModel;
  factory TransactionItemModel.fromJson(Map<String, dynamic> json) => _$TransactionItemModelFromJson(json);
}

@freezed
abstract class TransactionWarehouseModel with _$TransactionWarehouseModel {
  const factory TransactionWarehouseModel({required String id, required String name}) = _TransactionWarehouseModel;
  factory TransactionWarehouseModel.fromJson(Map<String, dynamic> json) => _$TransactionWarehouseModelFromJson(json);
}
