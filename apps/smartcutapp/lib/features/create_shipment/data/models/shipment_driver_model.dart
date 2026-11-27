import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment_driver_model.freezed.dart';

part 'shipment_driver_model.g.dart';

@freezed
abstract class ShipmentDriverModel with _$ShipmentDriverModel {
  const factory ShipmentDriverModel({
    required String id,
    required String name,
    required String phone,
    required String vehicleNumber,
    required String licenseNo,
    required String vehicleType,
  }) = _ShipmentDriverModel;

  factory ShipmentDriverModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDriverModelFromJson(json);
}
