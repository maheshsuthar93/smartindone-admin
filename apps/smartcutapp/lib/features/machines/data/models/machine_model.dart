import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'machine_model.freezed.dart';
part 'machine_model.g.dart';

@freezed
abstract class MachineFactoryModel with _$MachineFactoryModel {
  const factory MachineFactoryModel({
    required String id,
    required String name,
    String? code,
  }) = _MachineFactoryModel;

  factory MachineFactoryModel.fromJson(Map<String, dynamic> json) =>
      _$MachineFactoryModelFromJson(json);
}

@freezed
abstract class MachineModel with _$MachineModel {
  const factory MachineModel({
    required String id,
    required String name,
    required String code,
    required MachineType type,
    required String factoryId,
    @JsonKey(
      name: 'factory',
      fromJson: _machineFactoryFromJson,
      toJson: _machineFactoryToJson,
    )
    MachineFactoryModel? factorySummary,
    @Default(true) bool isActive,
    double? kerf,
  }) = _MachineModel;

  const MachineModel._();

  String get factoryName => factorySummary?.name ?? '';

  factory MachineModel.fromJson(Map<String, dynamic> json) =>
      _$MachineModelFromJson(json);
}

MachineFactoryModel? _machineFactoryFromJson(Object? json) => json == null
    ? null
    : MachineFactoryModel.fromJson(json as Map<String, dynamic>);

Map<String, dynamic>? _machineFactoryToJson(MachineFactoryModel? factory) =>
    factory?.toJson();
