import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_model.freezed.dart';

part 'driver_model.g.dart';

@freezed
abstract class DriverModel with _$DriverModel {
  const factory DriverModel({
    required String id,
    required String companyId,
    required String name,
    required String phone,
    String? email,
    required String licenseNo,
    required String vehicleNumber,
    required String vehicleType,
    required String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DriverModel;

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);
}
