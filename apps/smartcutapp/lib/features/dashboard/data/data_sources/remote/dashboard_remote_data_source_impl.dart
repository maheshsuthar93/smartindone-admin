import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/dashboard/data/models/dashboard_analytics_model.dart';
import 'package:dio/dio.dart';

import '../../models/dashboard_order_model.dart';
import 'dashboard_remote_data_source.dart';

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  DashboardRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<DashboardAnalyticsModel> getDashboardAnalytics() async {
    try {
      final response = await apiClient.get('/api/dashboard/analytics');

      final apiResponse = ApiResponse<DashboardAnalyticsModel>.fromJson(
        response.data,
        (data) =>
            DashboardAnalyticsModel.fromJson(data as Map<String, dynamic>),
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
  Future<PaginatedResult<DashboardOrderModel>> getDashboardOrders({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/dashboard/orders',
        queryParameters: {"page": page, "limit": limit},
      );

      final apiResponse = ApiResponse<List<DashboardOrderModel>>.fromJson(
        response.data,
        (data) =>
            (data as List).map((e) => DashboardOrderModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<DashboardOrderModel>(
        items: apiResponse.data ?? [],
        page: meta.page,
        total: meta.total,
        totalPages: meta.totalPages,
      );
    } on DioException {
      rethrow;
    }
  }
}
