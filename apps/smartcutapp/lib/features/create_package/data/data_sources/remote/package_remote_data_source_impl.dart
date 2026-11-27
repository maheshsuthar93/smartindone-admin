import 'package:board_cut/core/core.dart';

import '../../models/package_detail_model.dart';
import '../../models/available_package_piece_model.dart';
import '../../models/available_package_hardware_model.dart';
import 'package_remote_data_source.dart';

class PackageRemoteDataSourceImpl implements PackageRemoteDataSource {
  PackageRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PackageDetailModel> getPackage({required String packageId}) async {
    final response = await apiClient.get('/api/packages/$packageId');
    final apiResponse = ApiResponse<PackageDetailModel>.fromJson(
      Map<String, dynamic>.from(response.data as Map),
      (data) =>
          PackageDetailModel.fromJson(Map<String, dynamic>.from(data as Map)),
    );
    if (!apiResponse.success) {
      throw Exception(apiResponse.message);
    }
    if (apiResponse.data == null) {
      throw const FormatException('Package response did not contain data');
    }
    return apiResponse.data!;
  }

  @override
  Future<bool> createPackage({required Map<String, dynamic> data}) async {
    final response = await apiClient.post('/api/packages', data: data);
    final apiResponse = ApiResponse<dynamic>.fromJson(
      Map<String, dynamic>.from(response.data as Map),
      (data) => data,
    );
    if (!apiResponse.success) {
      throw Exception(apiResponse.message);
    }
    return apiResponse.success;
  }

  @override
  Future<bool> updatePackage({
    required String packageId,
    required Map<String, dynamic> data,
  }) async {
    final response = await apiClient.put(
      '/api/packages/$packageId',
      data: data,
    );
    final apiResponse = ApiResponse<dynamic>.fromJson(
      Map<String, dynamic>.from(response.data as Map),
      (data) => data,
    );
    if (!apiResponse.success) {
      throw Exception(apiResponse.message);
    }
    return apiResponse.success;
  }

  @override
  Future<List<AvailablePackagePieceModel>> getAvailablePieces({
    required String orderId,
  }) async {
    final response = await apiClient.get(
      '/api/order-part-pieces/order/$orderId/available-for-packaging',
    );
    final apiResponse = ApiResponse<List<AvailablePackagePieceModel>>.fromJson(
      Map<String, dynamic>.from(response.data as Map),
      (data) => (data as List)
          .map(
            (json) => AvailablePackagePieceModel.fromJson(
              Map<String, dynamic>.from(json as Map),
            ),
          )
          .toList(),
    );
    if (!apiResponse.success) {
      throw Exception(apiResponse.message);
    }
    return apiResponse.data ?? const [];
  }

  @override
  Future<List<AvailablePackageHardwareModel>> getAvailableHardware({
    required String warehouseId,
  }) async {
    final response = await apiClient.get(
      '/api/hardwares/warehouse/$warehouseId/available-for-packaging',
    );
    final apiResponse =
        ApiResponse<List<AvailablePackageHardwareModel>>.fromJson(
          Map<String, dynamic>.from(response.data as Map),
          (data) => (data as List)
              .map(
                (json) => AvailablePackageHardwareModel.fromJson(
                  Map<String, dynamic>.from(json as Map),
                ),
              )
              .toList(),
        );
    if (!apiResponse.success) {
      throw Exception(apiResponse.message);
    }
    return apiResponse.data ?? const [];
  }
}
