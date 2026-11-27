import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_customer_model.freezed.dart';

part 'order_detail_customer_model.g.dart';

@freezed
abstract class OrderDetailCustomerModel with _$OrderDetailCustomerModel {
  const factory OrderDetailCustomerModel({
    required String id,
    required String name,
    String? contactName,
    String? contactPhone,
    String? contactEmail,
  }) = _OrderDetailCustomerModel;

  factory OrderDetailCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailCustomerModelFromJson(json);
}
