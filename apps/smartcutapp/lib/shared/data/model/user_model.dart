import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'company_model.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String name,
    required UserRole role,
    required String companyId,
    required String createdAt,
    String? updatedAt,
    CompanyModel? company,
    required UserStatus status, // PLANNING, IN_PROGRESS, etc.

  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
