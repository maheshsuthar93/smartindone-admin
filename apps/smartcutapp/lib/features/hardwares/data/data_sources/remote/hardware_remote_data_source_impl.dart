import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/hardwares/data/models/hardware_model.dart';
import 'package:dio/dio.dart';

import 'hardware_remote_data_source.dart';

class HardwareRemoteDataSourceImpl implements HardwareRemoteDataSource {
  HardwareRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PaginatedResult<HardwareModel>> getHardwares({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/hardwares',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search != null && search.isNotEmpty) 'search': search,
        },
      );
      final apiResponse = ApiResponse<List<HardwareModel>>.fromJson(
        response.data,
        (data) => (data as List)
            .map((item) => HardwareModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
      if (!apiResponse.success) throw Exception(apiResponse.message);
      final pagination = apiResponse.pagination!;
      return PaginatedResult<HardwareModel>(
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
  Future<ApiResponse> createHardware({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post('/api/hardwares', data: data);
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> updateHardware({
    required String hardwareId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '/api/hardwares/$hardwareId',
        data: data,
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> deactivateHardware({required String hardwareId}) async {
    try {
      final response = await apiClient.delete('/api/hardwares/$hardwareId');
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
