import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_project_model.freezed.dart';

part 'order_detail_project_model.g.dart';

@freezed
abstract class OrderDetailProjectModel with _$OrderDetailProjectModel {
  const factory OrderDetailProjectModel({
    required String id,
    required String name,
  }) = _OrderDetailProjectModel;

  factory OrderDetailProjectModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailProjectModelFromJson(json);
}
