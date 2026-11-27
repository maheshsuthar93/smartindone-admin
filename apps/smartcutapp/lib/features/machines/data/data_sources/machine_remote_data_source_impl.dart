import 'package:board_cut/core/core.dart';

import '../models/machine_model.dart';
import 'machine_remote_data_source.dart';

class MachineRemoteDataSourceImpl implements MachineRemoteDataSource {
  MachineRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PaginatedResult<MachineModel>> getMachines({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await apiClient.get(
      '/api/machines',
      queryParameters: {
        'page': page,
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    final apiResponse = ApiResponse<List<MachineModel>>.fromJson(
      response.data,
      (data) => (data as List)
          .map((item) => MachineModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    if (!apiResponse.success) throw StateError(apiResponse.message);
    final pagination = apiResponse.pagination!;
    return PaginatedResult(
      items: apiResponse.data ?? [],
      page: pagination.page,
      total: pagination.total,
      totalPages: pagination.totalPages,
    );
  }

  @override
  Future<ApiResponse> createMachine({
    required Map<String, dynamic> data,
  }) async {
    final response = await apiClient.post('/api/machines', data: data);
    return ApiResponse.fromJson(response.data, (data) => data);
  }

  @override
  Future<ApiResponse> updateMachine({
    required String machineId,
    required Map<String, dynamic> data,
  }) async {
    final response = await apiClient.put(
      '/api/machines/$machineId',
      data: data,
    );
    return ApiResponse.fromJson(response.data, (data) => data);
  }

  @override
  Future<ApiResponse> deactivateMachine({required String machineId}) async {
    final response = await apiClient.delete('/api/machines/$machineId');
    return ApiResponse.fromJson(response.data, (data) => data);
  }
}
