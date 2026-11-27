import 'package:board_cut/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_detail_model.freezed.dart';
part 'project_detail_model.g.dart';

@freezed
abstract class ProjectDetailModel with _$ProjectDetailModel {
  const factory ProjectDetailModel({
    required String id,
    required String name,
    @JsonKey(unknownEnumValue: ProjectStatus.unknown)
    required ProjectStatus status,
    required String customerId,
    required String companyId,
    String? description,
    DateTime? startDate,
    DateTime? expectedEndDate,
    DateTime? actualEndDate,
    String? deliveryAddress,
    String? deliveryAddress2,
    String? deliveryCity,
    String? deliveryState,
    String? deliveryPostalCode,
    String? deliveryCountry,
    String? contactName,
    String? contactPhone,
    String? contactEmail,
    DateTime? createdAt,
    DateTime? updatedAt,
    ProjectDetailCustomerModel? customer,
    @JsonKey(readValue: _readOrdersCount) @Default(0) int ordersCount,
  }) = _ProjectDetailModel;

  factory ProjectDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailModelFromJson(json);
}

@freezed
abstract class ProjectDetailCustomerModel with _$ProjectDetailCustomerModel {
  const factory ProjectDetailCustomerModel({
    required String id,
    required String name,
    String? phone,
    String? email,
  }) = _ProjectDetailCustomerModel;

  factory ProjectDetailCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailCustomerModelFromJson(json);
}

Object? _readOrdersCount(Map json, String key) =>
    (json['_count'] as Map?)?['orders'] ?? json[key];
