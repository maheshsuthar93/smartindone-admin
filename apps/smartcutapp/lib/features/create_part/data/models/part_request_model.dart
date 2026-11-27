import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_request_model.freezed.dart';
part 'part_request_model.g.dart';

@freezed
abstract class PartRequestModel with _$PartRequestModel {
  const factory PartRequestModel({
    required String orderItemId,
    required String name,
    required double width,
    required double height,
    required double thickness,
    @Default(true) bool rotatable,
    GrainDirection? grainDirection,
    double? edgeBandTop,
    double? edgeBandBottom,
    double? edgeBandLeft,
    double? edgeBandRight,
    @Default(false) bool grain,
    required String materialId,
    required int quantity,
  }) = _PartRequestModel;

  factory PartRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PartRequestModelFromJson(json);
}
