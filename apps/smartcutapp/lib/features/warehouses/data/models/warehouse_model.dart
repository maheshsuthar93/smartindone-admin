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
    @Default('')
    @JsonKey(readValue: _readFactoryName, includeToJson: false)
    String factoryName,
    @JsonKey(readValue: _readFactoryCode, includeToJson: false)
    String? factoryCode,
    @Default(0)
    @JsonKey(readValue: _readInventoryBalanceCount, includeToJson: false)
    int inventoryBalanceCount,
    @Default(0)
    @JsonKey(readValue: _readSheetCount, includeToJson: false)
    int sheetCount,
  }) = _WarehouseModel;

  factory WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseModelFromJson(json);
}

Object? _readFactoryName(Map json, String key) =>
    (json['factory'] as Map?)?['name'];
Object? _readFactoryCode(Map json, String key) =>
    (json['factory'] as Map?)?['code'];
Object? _readInventoryBalanceCount(Map json, String key) =>
    (json['_count'] as Map?)?['inventory'];
Object? _readSheetCount(Map json, String key) =>
    (json['_count'] as Map?)?['sheets'];
