import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/shipments/data/models/model.dart';
import 'package:dio/dio.dart';

import 'shipment_remote_data_source.dart';

class ShipmentRemoteDataSourceImpl implements ShipmentRemoteDataSource {
  ShipmentRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PaginatedResult<ShipmentModel>> getShipments({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/shipments',
        queryParameters: {"page": page, "limit": limit},
      );

      final apiResponse = ApiResponse<List<ShipmentModel>>.fromJson(
        response.data,
        (data) => (data as List).map((e) => ShipmentModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<ShipmentModel>(
        items: apiResponse.data ?? [],
        page: meta.page,
        total: meta.total,
        totalPages: meta.totalPages,
      );
    } on DioException {
      rethrow;
    }
  }
}
