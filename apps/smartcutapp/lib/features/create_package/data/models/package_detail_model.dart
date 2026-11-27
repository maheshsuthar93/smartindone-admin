import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_detail_model.freezed.dart';
part 'package_detail_model.g.dart';

@freezed
abstract class PackageDetailModel with _$PackageDetailModel {
  const factory PackageDetailModel({
    @JsonKey(readValue: _readId) required String id,
    @JsonKey(readValue: _readName) required String name,
    @Default('PACKING') String status,
    String? shipmentId,
  }) = _PackageDetailModel;

  factory PackageDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailModelFromJson(json);
}

Object? _readId(Map json, String key) => json[key] ?? json['packageId'];
Object? _readName(Map json, String key) =>
    json[key] ?? json['packageName'] ?? json['packageNumber'] ?? '';
