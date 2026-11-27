import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_package_hardware_model.freezed.dart';
part 'available_package_hardware_model.g.dart';

@freezed
abstract class AvailablePackageHardwareModel
    with _$AvailablePackageHardwareModel {
  const factory AvailablePackageHardwareModel({
    required String id,
    required String code,
    required String name,
    required String type,
    required String unit,
    @Default(0) int availableStock,
    String? brand,
    String? finish,
    String? specification,
  }) = _AvailablePackageHardwareModel;

  factory AvailablePackageHardwareModel.fromJson(Map<String, dynamic> json) =>
      _$AvailablePackageHardwareModelFromJson(json);
}
