import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment_detail_model.freezed.dart';

part 'shipment_detail_model.g.dart';

@freezed
abstract class ShipmentDetailModel with _$ShipmentDetailModel {
  const factory ShipmentDetailModel({
    required String id,
    required String shipmentNo,
    required String orderId,
    String? driverId,
    String? deliveryAddress,
    String? deliveryAddress2,
    String? deliveryCity,
    String? deliveryState,
    String? deliveryPostalCode,
    String? deliveryCountry,
    String? deliveryInstructions,

    required ShipmentStatus status,
    DateTime? dispatchDate,
    DateTime? deliveryDate,
    DateTime? actualDeliveryDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    DriverModel? driver,
   // @Default([]) List<PackageModel> packages,
    required OrderModel order,
  }) = _ShipmentDetailModel;

  factory ShipmentDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDetailModelFromJson(json);
}

@freezed
abstract class DriverModel with _$DriverModel {
  const factory DriverModel({
    required String name,
    required String phone,
    required String vehicleNumber,
  }) = _DriverModel;

  factory DriverModel.fromJson(Map<String, dynamic> json) =>
      _$DriverModelFromJson(json);
}

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    int? orderNumber,
    String? orderCode,
    required CustomerModel customer,
    required ProjectModel project,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel({required String id, required String name}) =
      _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

@freezed
abstract class PackageModel with _$PackageModel {
  const factory PackageModel({
    required String id,
    required String packageNumber,
    double? weight,
    double? length,
    double? width,
    double? height,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);
}

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({required String id, required String name}) =
      _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
