import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_factory_model.freezed.dart';
part 'order_factory_model.g.dart';

@freezed
abstract class OrderFactoryModel with _$OrderFactoryModel {
  const factory OrderFactoryModel({required String id, required String name}) =
      _OrderFactoryModel;

  factory OrderFactoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderFactoryModelFromJson(json);
}
