import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import '../../models/warehouse_model.dart';
import 'warehouse_remote_data_source.dart';

class WarehouseRemoteDataSourceImpl implements WarehouseRemoteDataSource {
  WarehouseRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<ApiResponse> createWarehouse({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post('/api/warehouses', data: data);
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<PaginatedResult<WarehouseModel>> getWarehouses({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/warehouses',
        queryParameters: {"page": page, "limit": limit},
      );

      final apiResponse = ApiResponse<List<WarehouseModel>>.fromJson(
        response.data,
        (data) =>
            (data as List).map((e) => WarehouseModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<WarehouseModel>(
        items: apiResponse.data ?? [],
        page: meta.page,
        total: meta.total,
        totalPages: meta.totalPages,
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> updateWarehouse({
    required String warehouseId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '/api/warehouses/$warehouseId',
        data: data,
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
