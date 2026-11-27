import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/projects/data/models/project_analytics_model.dart';
import 'package:dio/dio.dart';

import '../../models/project_model.dart';
import '../../models/project_detail_model.dart';
import 'project_remote_data_source.dart';

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  ProjectRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PaginatedResult<ProjectModel>> getProjects({
    required int page,
    required int limit,
    String? customerId,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/projects',
        queryParameters: {
          "page": page,
          "limit": limit,
          "customerId": ?customerId,
        },
      );

      final apiResponse = ApiResponse<List<ProjectModel>>.fromJson(
        response.data,
        (data) => (data as List).map((e) => ProjectModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<ProjectModel>(
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
  Future<ProjectAnalyticsModel> getProjectAnalytics() async {
    try {
      final response = await apiClient.get('/api/projects/analytics');

      final apiResponse = ApiResponse<ProjectAnalyticsModel>.fromJson(
        response.data,
        (data) => ProjectAnalyticsModel.fromJson(data as Map<String, dynamic>),
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
  Future<ProjectDetailModel> getProjectById({required String projectId}) async {
    final response = await apiClient.get('/api/projects/$projectId');
    final apiResponse = ApiResponse<ProjectDetailModel>.fromJson(
      response.data,
      (data) => ProjectDetailModel.fromJson(data as Map<String, dynamic>),
    );

    if (!apiResponse.success || apiResponse.data == null) {
      throw Exception(apiResponse.message);
    }
    return apiResponse.data!;
  }

  @override
  Future<bool> createProject({
    required String customerId,
    required Map<String, dynamic> data,
  }) async {
    final response = await apiClient.post(
      '/api/projects/$customerId',
      data: data,
    );
    final apiResponse = ApiResponse<dynamic>.fromJson(
      Map<String, dynamic>.from(response.data as Map),
      (data) => data,
    );
    if (!apiResponse.success) throw Exception(apiResponse.message);
    return true;
  }

  @override
  Future<bool> updateProject({
    required String projectId,
    required Map<String, dynamic> data,
  }) async {
    final response = await apiClient.put(
      '/api/projects/$projectId',
      data: data,
    );
    final apiResponse = ApiResponse<dynamic>.fromJson(
      Map<String, dynamic>.from(response.data as Map),
      (data) => data,
    );
    if (!apiResponse.success) throw Exception(apiResponse.message);
    return true;
  }
}
