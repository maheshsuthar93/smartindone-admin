import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_material_option.freezed.dart';
part 'part_material_option.g.dart';

@freezed
abstract class PartMaterialOption with _$PartMaterialOption {
  const factory PartMaterialOption({required String id, required String name}) =
      _PartMaterialOption;

  factory PartMaterialOption.fromJson(Map<String, dynamic> json) =>
      _$PartMaterialOptionFromJson(json);
}
