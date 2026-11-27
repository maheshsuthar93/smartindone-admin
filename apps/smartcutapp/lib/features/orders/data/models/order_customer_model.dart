import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_customer_model.freezed.dart';

part 'order_customer_model.g.dart';

@freezed
abstract class OrderCustomerModel with _$OrderCustomerModel {
  const factory OrderCustomerModel({required String id, required String name}) =
      _OrderCustomerModel;

  factory OrderCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$OrderCustomerModelFromJson(json);
}
