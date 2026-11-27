import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/part_model.dart';
import 'package:dio/dio.dart';

import '../../model/order_item_details_model.dart';
import 'item_detail_remote_data_source.dart';

class ItemDetailRemoteDataSourceImpl implements ItemDetailRemoteDataSource {
  ItemDetailRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<OrderItemDetailsModel> getItemById(String id) async {
    try {
      final response = await apiClient.get('/api/order-items/$id');

      final apiResponse = ApiResponse<OrderItemDetailsModel>.fromJson(
        response.data,
        (data) => OrderItemDetailsModel.fromJson(data as Map<String, dynamic>),
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
  Future<PaginatedResult<PartModel>> getPartsByItemId({
    required int page,
    required int limit,
    required String itemId,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/order-item-parts',
        queryParameters: {"page": page, "limit": limit, "itemId": itemId},
      );

      final apiResponse = ApiResponse<List<PartModel>>.fromJson(
        response.data,
        (data) => (data as List).map((e) => PartModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<PartModel>(
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
  Future<ApiResponse> uploadPartsByItemId({required dynamic data}) async {
    try {
      final response = await apiClient.uploadMultiPart(
        '/api/order-item-parts/import',
        data: data,
      );

      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
