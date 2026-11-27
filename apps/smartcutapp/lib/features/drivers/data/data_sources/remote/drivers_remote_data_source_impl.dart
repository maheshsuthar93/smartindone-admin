import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import 'drivers_remote_data_source.dart';
import '../../models/driver_model.dart';

class DriversRemoteDataSourceImpl implements DriversRemoteDataSource {
  DriversRemoteDataSourceImpl(this.api);

  final ApiClient api;

  @override
  Future<PaginatedResult<DriverModel>> getDrivers({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final response = await api.get(
        '/api/drivers',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search?.isNotEmpty == true) 'search': search,
        },
      );
      final body = response.data as Map<String, dynamic>;
      if (body['success'] != true) {
        throw Exception(body['message'] ?? 'Could not load drivers');
      }
      final meta = body['pagination'] as Map<String, dynamic>;
      return PaginatedResult(
        items: ((body['data'] as List?) ?? [])
            .map(
              (row) =>
                  DriverModel.fromJson((row as Map).cast<String, dynamic>()),
            )
            .toList(),
        page: (meta['page'] as num).toInt(),
        total: (meta['total'] as num).toInt(),
        totalPages: (meta['totalPages'] as num).toInt(),
      );
    } on DioException {
      rethrow;
    }
  }

  Future<ApiResponse> _response(
    Future<Response<dynamic>> Function() request,
  ) async {
    try {
      final response = await request();
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> createDriver(Map<String, dynamic> data) =>
      _response(() => api.post('/api/drivers', data: data));

  @override
  Future<ApiResponse> updateDriver(String id, Map<String, dynamic> data) =>
      _response(() => api.put('/api/drivers/$id', data: data));

  @override
  Future<ApiResponse> deleteDriver(String id) =>
      _response(() => api.delete('/api/drivers/$id'));
}
