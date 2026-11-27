import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import '../../model/part_detail_model.dart';
import '../../model/part_detail_piece_model.dart';
import 'part_detail_remote_data_source.dart';

class PartDetailRemoteDataSourceImpl implements PartDetailRemoteDataSource {
  PartDetailRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PartDetailModel> getPartById(String id) async {
    try {
      final response = await apiClient.get('/api/order-item-parts/$id');

      final apiResponse = ApiResponse<PartDetailModel>.fromJson(
        response.data,
        (data) => PartDetailModel.fromJson(data as Map<String, dynamic>),
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
  Future<PaginatedResult<PartDetailPieceModel>> getPiecesByPartId({
    required int page,
    required int limit,
    required String partId,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/order-part-pieces',
        queryParameters: {"page": page, "limit": limit, "partId": partId},
      );

      final apiResponse = ApiResponse<List<PartDetailPieceModel>>.fromJson(
        response.data,
        (data) => (data as List)
            .map((e) => PartDetailPieceModel.fromJson(e))
            .toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<PartDetailPieceModel>(
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
  Future<ApiResponse<dynamic>> generatePiecesByPartId({
    required String partId,
  }) async {
    try {
      final response = await apiClient.post(
        '/api/order-part-pieces/generate/$partId',
      );

      return ApiResponse<dynamic>.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
