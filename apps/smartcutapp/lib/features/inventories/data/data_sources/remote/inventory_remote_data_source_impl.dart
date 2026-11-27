import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/inventories/data/models/inventory_analytics_model.dart';
import 'package:dio/dio.dart';

import '../../models/inventory_model.dart';
import 'inventory_remote_data_source.dart';

class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  InventoryRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PaginatedResult<InventoryModel>> getInventories({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/inventory-balances',
        queryParameters: {"page": page, "limit": limit},
      );

      final apiResponse = ApiResponse<List<InventoryModel>>.fromJson(
        response.data,
        (data) =>
            (data as List).map((e) => InventoryModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<InventoryModel>(
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
  Future<InventoryAnalyticsModel> getInventoryAnalytics() async {
    try {
      final response = await apiClient.get('/api/inventory-balances/analytics');

      final apiResponse = ApiResponse<InventoryAnalyticsModel>.fromJson(
        response.data,
        (data) =>
            InventoryAnalyticsModel.fromJson(data as Map<String, dynamic>),
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
  Future<bool> createAdjustment({
    required String? materialId,
    required String? hardwareId,
    required String warehouseId,
    required num quantityChange,
    required String transactionType,
    String? notes,
  }) async {
    final response = await apiClient.post(
      '/api/inventory-transactions',
      data: {
        'materialId': ?materialId,
        'hardwareId': ?hardwareId,
        'warehouseId': warehouseId,
        'quantityChange': quantityChange,
        'transactionType': transactionType,
        if (notes != null && notes.trim().isNotEmpty) 'notes': notes.trim(),
      },
    );
    final body = response.data;
    if (body is Map && body['success'] == false) {
      throw Exception(body['message'] ?? 'Unable to update inventory');
    }
    return true;
  }
}
