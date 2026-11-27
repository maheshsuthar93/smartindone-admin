import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_customer_model.dart';
import 'order_factory_model.dart';
import 'order_project_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    required int orderNumber,
    required String companyId,
    required String projectId,
    required OrderStatus status,
    required DateTime deliveryDate,
    required OrderCustomerModel customer,
    required OrderProjectModel project,
    OrderFactoryModel? factory,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
