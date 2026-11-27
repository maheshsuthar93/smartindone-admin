import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/orders/data/models/order_analytics_model.dart';
import 'package:board_cut/features/orders/data/models/order_model.dart';
import 'package:dio/dio.dart';

import 'order_remote_data_source.dart';

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  OrderRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PaginatedResult<OrderModel>> getOrders({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/orders',
        queryParameters: {
          "page": page,
          "limit": limit,
          if (search != null && search.trim().isNotEmpty)
            "search": search.trim(),
        },
      );

      final apiResponse = ApiResponse<List<OrderModel>>.fromJson(
        response.data,
        (data) => (data as List).map((e) => OrderModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<OrderModel>(
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
  Future<OrderAnalyticsModel> getOrderAnalytics() async {
    try {
      final response = await apiClient.get('/api/orders/analytics');

      final apiResponse = ApiResponse<OrderAnalyticsModel>.fromJson(
        response.data,
        (data) => OrderAnalyticsModel.fromJson(data as Map<String, dynamic>),
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
  Future<Map<String, dynamic>> getOrderForUpdate(String orderId) async {
    final response = await apiClient.get('/api/orders/$orderId');
    final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
      response.data,
      (data) => Map<String, dynamic>.from(data as Map),
    );
    if (!apiResponse.success || apiResponse.data == null) {
      throw Exception(apiResponse.message);
    }
    return apiResponse.data!;
  }

  @override
  Future<ApiResponse> updateOrder({
    required String orderId,
    required Map<String, dynamic> data,
  }) async {
    final response = await apiClient.put('/api/orders/$orderId', data: data);
    return ApiResponse.fromJson(response.data, (data) => data);
  }

  @override
  Future<ApiResponse> createOrder({required Map<String, dynamic> data}) async {
    final response = await apiClient.post('/api/orders', data: data);
    return ApiResponse.fromJson(response.data, (data) => data);
  }
}
