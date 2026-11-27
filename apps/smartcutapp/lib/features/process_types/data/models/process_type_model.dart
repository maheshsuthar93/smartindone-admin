import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_type_model.freezed.dart';

part 'process_type_model.g.dart';

@freezed
abstract class ProcessTypeModel with _$ProcessTypeModel {
  const factory ProcessTypeModel({
    required String id,
    required String name,
    required int sequenceOrder,
    @Default(true) bool isActive,
  }) = _ProcessTypeModel;

  factory ProcessTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ProcessTypeModelFromJson(json);
}
