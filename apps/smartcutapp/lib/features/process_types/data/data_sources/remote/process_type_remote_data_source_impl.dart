import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import '../../models/process_type_model.dart';
import 'process_type_remote_data_source.dart';

class ProcessTypeRemoteDataSourceImpl implements ProcessTypeRemoteDataSource {
  ProcessTypeRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;
  static const _endpoint = '/api/piece-process-types';

  @override
  Future<List<ProcessTypeModel>> getProcessTypes() async {
    try {
      final response = await apiClient.get(_endpoint);
      final apiResponse = ApiResponse<List<ProcessTypeModel>>.fromJson(
        response.data,
        (data) => (data as List<dynamic>)
            .map(
              (item) => ProcessTypeModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
      if (!apiResponse.success) throw Exception(apiResponse.message);
      return apiResponse.data ?? [];
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> createProcessType({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post(_endpoint, data: data);
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> updateProcessType({
    required String processTypeId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '$_endpoint/$processTypeId',
        data: data,
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> deleteProcessType({required String processTypeId}) async {
    try {
      final response = await apiClient.delete('$_endpoint/$processTypeId');
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
