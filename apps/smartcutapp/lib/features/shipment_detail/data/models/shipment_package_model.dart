import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment_package_model.freezed.dart';
part 'shipment_package_model.g.dart';

@freezed
abstract class ShipmentPackageModel with _$ShipmentPackageModel {
  const factory ShipmentPackageModel({
    required String id,
    @Default(0) int pieceNumber,
    @Default('') String pieceCode,
    String? status,
    int? itemsCount,
    int? hardwareCount,
    num? weight,
    num? length,
    num? width,
    num? height,
  }) = _ShipmentPackageModel;

  factory ShipmentPackageModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentPackageModelFromJson(json);
}
