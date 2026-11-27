import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import '../../model/material_group_model.dart';
import '../../model/optimization_model.dart';
import 'optimizations_remote_data_source.dart';

class OptimizationsRemoteDataSourceImpl
    implements OptimizationsRemoteDataSource {
  OptimizationsRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<List<OptimizationModel>> getOptimizationsByOrderId({
    required String orderId,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/orders/optimizations/$orderId',
      );

      final apiResponse = ApiResponse<List<OptimizationModel>>.fromJson(
        response.data,
        (data) =>
            (data as List).map((e) => OptimizationModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      return apiResponse.data ?? [];
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<PaginatedResult<MaterialGroupModel>>
  getMaterialGroupsByOptimizationId({
    required String optimizationId,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/optimizations/$optimizationId/material-groups',
        queryParameters: {"page": page, "limit": limit},
      );

      final apiResponse = ApiResponse<List<MaterialGroupModel>>.fromJson(
        response.data,
        (data) =>
            (data as List).map((e) => MaterialGroupModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<MaterialGroupModel>(
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
  Future<List<OptimizationModel>> createOrderOptimization({
    required String orderId,
  }) async {
    try {
      final response = await apiClient.post(
        '/api/optimizations',
        data: {"orderId": orderId},
      );

      final apiResponse = ApiResponse<List<OptimizationModel>>.fromJson(
        response.data,
        (data) {
          // Creation returns one optimization; normalize it to the repository
          // contract, which is a list.
          if (data is List) {
            return data
                .map((item) => OptimizationModel.fromJson(item))
                .toList();
          }
          return [OptimizationModel.fromJson(data as Map<String, dynamic>)];
        },
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      return apiResponse.data ?? [];
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> runOptimizationMaterialGroup({
    required String materialGroupId,
  }) async {
    try {
      final response = await apiClient.post(
        '/api/optimization-material-groups/$materialGroupId/run',
      );

      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
