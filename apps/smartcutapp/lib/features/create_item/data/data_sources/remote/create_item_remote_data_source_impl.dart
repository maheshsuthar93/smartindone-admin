import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:dio/dio.dart';

import 'create_item_remote_data_source.dart';

class CreateItemRemoteDataSourceImpl implements CreateItemRemoteDataSource {
  CreateItemRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<ApiResponse<OrderItemDetailsModel>> createItem({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post('/api/order-items', data: data);
      return ApiResponse<OrderItemDetailsModel>.fromJson(
        response.data,
        (value) =>
            OrderItemDetailsModel.fromJson(value as Map<String, dynamic>),
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<OrderItemDetailsModel>> updateItem({
    required String itemId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '/api/order-items/$itemId',
        data: data,
      );
      return ApiResponse<OrderItemDetailsModel>.fromJson(
        response.data,
        (value) =>
            OrderItemDetailsModel.fromJson(value as Map<String, dynamic>),
      );
    } on DioException {
      rethrow;
    }
  }
}
