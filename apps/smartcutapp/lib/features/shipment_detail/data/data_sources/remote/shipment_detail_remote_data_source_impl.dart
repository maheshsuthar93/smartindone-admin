import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import '../../models/shipment_detail_model.dart';
import '../../models/shipment_package_model.dart';
import 'shipment_detail_remote_data_source.dart';

class ShipmentDetailRemoteDataSourceImpl
    implements ShipmentDetailRemoteDataSource {
  ShipmentDetailRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<ShipmentDetailModel> getShipmentDetail({required String id}) async {
    try {
      final response = await apiClient.get('/api/shipments/$id');

      final apiResponse = ApiResponse<ShipmentDetailModel>.fromJson(
        response.data,
        (data) => ShipmentDetailModel.fromJson(data as Map<String, dynamic>),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      return apiResponse.data!;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<ShipmentPackageModel>> getShipmentPackages({
    required String shipmentId,
  }) async {
    final response = await apiClient.get(
      '/api/packages/',
      queryParameters: {'shipmentId': shipmentId},
    );
    final apiResponse = ApiResponse<List<ShipmentPackageModel>>.fromJson(
      Map<String, dynamic>.from(response.data as Map),
      (data) => (data as List)
          .map(
            (json) => ShipmentPackageModel.fromJson(
              Map<String, dynamic>.from(json as Map),
            ),
          )
          .toList(),
    );
    if (!apiResponse.success) throw Exception(apiResponse.message);
    return apiResponse.data ?? const [];
  }
}
