import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:board_cut/core/enums/enums.dart';

import 'package_item_model.dart';

part 'package_model.freezed.dart';

part 'package_model.g.dart';

@freezed
abstract class PackageModel with _$PackageModel {
  const factory PackageModel({
    required int id,
    required String shipmentId,
    required String packageNo,
    double? weight,
    double? length,
    double? width,
    double? height,
    required PackageStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default([]) List<PackageItemModel> items,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);
}
