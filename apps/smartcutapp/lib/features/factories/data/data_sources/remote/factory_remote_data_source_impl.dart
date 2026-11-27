import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import '../../models/factory_model.dart';
import 'factory_remote_data_source.dart';

class FactoryRemoteDataSourceImpl implements FactoryRemoteDataSource {
  FactoryRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<List<FactoryModel>> getFactories() async {
    try {
      final response = await apiClient.get('/api/factories');
      final apiResponse = ApiResponse<List<FactoryModel>>.fromJson(
        response.data,
        (data) => (data as List)
            .map((item) => FactoryModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
      if (!apiResponse.success) throw Exception(apiResponse.message);
      return apiResponse.data ?? [];
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> createFactory({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post('/api/factories', data: data);
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> updateFactory({
    required String factoryId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '/api/factories/$factoryId',
        data: data,
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
