import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'optimization_model.freezed.dart';

part 'optimization_model.g.dart';

@freezed
abstract class OptimizationModel with _$OptimizationModel {
  const factory OptimizationModel({
    required String id,
    required String optimizationNo,
    required OptimizationStatus status,
    double? kerf,
    String? contactPhone,
    String? contactEmail,
  }) = _OptimizationModel;

  factory OptimizationModel.fromJson(Map<String, dynamic> json) =>
      _$OptimizationModelFromJson(json);
}
