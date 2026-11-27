import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/order_detail/data/model/order_detail_customer_model.dart';
import 'package:board_cut/features/order_detail/data/model/order_detail_project_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_model.freezed.dart';

part 'order_detail_model.g.dart';

@freezed
abstract class OrderDetailModel with _$OrderDetailModel {
  const factory OrderDetailModel({
    required String id,
    required String orderCode,
    required DateTime createdAt,
    required OrderStatus status,
    String? description,
    int? totalItems,
    int? totalPieces,
    required DateTime deliveryDate,
    required OrderDetailProjectModel project,
    required OrderDetailCustomerModel customer,
    required OrderDetailsCountsModel counts,
  }) = _OrderDetailModel;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);
}

@freezed
abstract class OrderDetailsCountsModel with _$OrderDetailsCountsModel {
  const factory OrderDetailsCountsModel({
    required int totalItems,
    required int totalParts,
    required int totalPieces,
  }) = _OrderDetailsCountsModel;

  factory OrderDetailsCountsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsCountsModelFromJson(json);
}
