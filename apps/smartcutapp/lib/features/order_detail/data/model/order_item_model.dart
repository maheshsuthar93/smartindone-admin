import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/enums.dart';

part 'order_item_model.freezed.dart';

part 'order_item_model.g.dart';

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required String id,
    required String orderId,
    required String name,
    required DateTime createdAt,
    required int quantity,
    int? overallWidth,
    int? overallHeight,
    int? overallDepth,
    required ProductionModel production,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}

@freezed
abstract class ProductionModel with _$ProductionModel {
  const factory ProductionModel({
    required ItemStatus status,
    required int totalPieces,
    required int completedPieces,
    required int pendingPieces,
    required double progressPercent,
  }) = _ProductionModel;

  factory ProductionModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionModelFromJson(json);
}
