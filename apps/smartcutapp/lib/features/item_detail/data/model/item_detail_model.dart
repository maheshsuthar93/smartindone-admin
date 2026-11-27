import 'package:board_cut/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_detail_model.freezed.dart';

part 'item_detail_model.g.dart';

@freezed
abstract class ItemDetailModel with _$ItemDetailModel {
  const factory ItemDetailModel({
    required String id,
    required String orderId,
    required String name,
    required double overallWidth,
    required double overallHeight,
    required double overallDepth,
    required int quantity,
    required DateTime createdAt,
    ProgressModel? progress,
  }) = _ItemDetailModel;

  factory ItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailModelFromJson(json);
}

@freezed
abstract class ProgressModel with _$ProgressModel {
  const factory ProgressModel({
    required ItemStatus status,
    required int totalPieces,
    required int completedPieces,
    required int pendingPieces,
    required double progressPercent,
    List<StagesModel>? stages,
  }) = _ProgressModel;

  factory ProgressModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressModelFromJson(json);
}

@freezed
abstract class StagesModel with _$StagesModel {
  const factory StagesModel({
    required String name,
    required int total,
    required int completed,
    required double progressPercent,
  }) = _StagesModel;

  factory StagesModel.fromJson(Map<String, dynamic> json) =>
      _$StagesModelFromJson(json);
}
