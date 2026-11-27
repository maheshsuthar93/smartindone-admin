import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_project_model.freezed.dart';
part 'order_project_model.g.dart';

@freezed
abstract class OrderProjectModel with _$OrderProjectModel {
  const factory OrderProjectModel({required String id, required String name}) =
      _OrderProjectModel;

  factory OrderProjectModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProjectModelFromJson(json);
}
