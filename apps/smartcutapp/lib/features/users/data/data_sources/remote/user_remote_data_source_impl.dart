import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/users/data/data_sources/remote/user_remote_data_source.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:dio/dio.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PaginatedResult<UserModel>> getUsers({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/users',
        queryParameters: {"page": page, "limit": limit},
      );

      final apiResponse = ApiResponse<List<UserModel>>.fromJson(
        response.data,
        (data) => (data as List)
            .map((item) {
              final json = Map<String, dynamic>.from(item as Map);
              // Global super-admin accounts have no company relation.
              json['companyId'] ??= '';
              return UserModel.fromJson(json);
            })
            .toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<UserModel>(
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
  Future<ApiResponse> updateUser({
    required String userId,
    required Map<String, dynamic> data,
  }) async {
    final response = await apiClient.put('/api/users/$userId', data: data);
    return ApiResponse.fromJson(response.data, (data) => data);
  }

  @override
  Future<ApiResponse> createUser({required Map<String, dynamic> data}) async {
    final response = await apiClient.post('/api/users', data: data);
    return ApiResponse.fromJson(response.data, (data) => data);
  }
}
