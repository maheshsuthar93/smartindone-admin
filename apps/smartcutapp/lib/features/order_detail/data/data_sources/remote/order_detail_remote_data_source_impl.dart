import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/order_detail/data/model/model.dart';
import 'package:board_cut/features/order_detail/data/model/order_item_model.dart';
import 'package:dio/dio.dart';

import 'order_detail_remote_data_source.dart';

class OrderDetailRemoteDataSourceImpl implements OrderDetailRemoteDataSource {
  OrderDetailRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<OrderDetailModel> getOrderById(String id) async {
    try {
      final response = await apiClient.get('/api/orders/$id');

      final apiResponse = ApiResponse<OrderDetailModel>.fromJson(
        response.data,
        (data) => OrderDetailModel.fromJson(data as Map<String, dynamic>),
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
  Future<PaginatedResult<OrderItemModel>> getItemsByOrderId({
    required int page,
    required int limit,
    required String orderId,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/order-items',
        queryParameters: {"page": page, "limit": limit, "orderId": orderId},
      );

      final apiResponse = ApiResponse<List<OrderItemModel>>.fromJson(
        response.data,
        (data) =>
            (data as List).map((e) => OrderItemModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<OrderItemModel>(
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
  Future<ApiResponse> generatePiecesForOrder(String orderId) async {
    try {
      final response = await apiClient.post(
        '/api/orders/$orderId/generate-pieces',
      );

      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<dynamic>> uploadItemsByOrderId({required data}) async {
    try {
      final response = await apiClient.uploadMultiPart(
        '/api/order-items/import',
        data: data,
      );

      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
