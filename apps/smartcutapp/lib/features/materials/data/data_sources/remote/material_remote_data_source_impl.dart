import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:dio/dio.dart';

import 'material_remote_data_source.dart';

class MaterialRemoteDataSourceImpl implements MaterialRemoteDataSource {
  MaterialRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PaginatedResult<MaterialModel>> getMaterials({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/materials',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search != null && search.isNotEmpty) 'search': search,
        },
      );
      final apiResponse = ApiResponse<List<MaterialModel>>.fromJson(
        response.data,
        (data) => (data as List).map((e) => MaterialModel.fromJson(e)).toList(),
      );
      if (!apiResponse.success) throw Exception(apiResponse.message);
      final pagination = apiResponse.pagination!;
      return PaginatedResult<MaterialModel>(
        items: apiResponse.data ?? [],
        page: pagination.page,
        total: pagination.total,
        totalPages: pagination.totalPages,
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> createMaterial({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post('/api/materials', data: data);
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> updateMaterial({
    required String materialId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '/api/materials/$materialId',
        data: data,
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> deleteMaterial({required String materialId}) async {
    try {
      final response = await apiClient.delete('/api/materials/$materialId');
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
