import 'package:board_cut/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'warehouse_model.freezed.dart';

part 'warehouse_model.g.dart';

@freezed
abstract class WarehouseModel with _$WarehouseModel {
  const factory WarehouseModel({
    required String id,
    required String companyId,
    required String factoryId,
    String? location,
    required String name,
    String? contactName,
    String? contactEmail,
    String? contactPhone,
    required WarehouseStatus status,
  }) = _WarehouseModel;

  factory WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseModelFromJson(json);
}
