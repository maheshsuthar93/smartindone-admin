import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';

part 'project_model.g.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    required String customerId,
    required String companyId,
    required String name,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,

    String? contactName,
    String? contactEmail,
    String? contactPhone,

    required ProjectStatus status, // PLANNING, IN_PROGRESS, etc.

    DateTime? startDate,
    DateTime? expectedEndDate,
    DateTime? actualEndDate,

    @Default(true) bool isActive,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
