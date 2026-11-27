import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_shipment_order_model.freezed.dart';

part 'create_shipment_order_model.g.dart';

@freezed
abstract class CreateShipmentOrderModel with _$CreateShipmentOrderModel {
  const factory CreateShipmentOrderModel({
    required String id,
    required String orderCode,
  }) = _CreateShipmentOrderModel;

  factory CreateShipmentOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CreateShipmentOrderModelFromJson(json);
}
